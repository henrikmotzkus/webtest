"""
Create a pool of nodes
"""

import datetime
import io
import os
import sys
import time

from azure.storage.blob import (
    BlobServiceClient,
    BlobSasPermissions,
    generate_blob_sas
)
from azure.batch import BatchServiceClient
from azure.batch.batch_auth import SharedKeyCredentials
import azure.batch.models as batchmodels
from azure.core.exceptions import ResourceExistsError

import clientconfig

DEFAULT_ENCODING = "utf-8"


# Update the Batch and Storage account credential strings in config.py with values
# unique to your accounts. These are used when constructing connection strings
# for the Batch and Storage client objects.

def query_yes_no(question: str, default: str = "yes") -> str:
    """
    Prompts the user for yes/no input, displaying the specified question text.

    :param str question: The text of the prompt for input.
    :param str default: The default if the user hits <ENTER>. Acceptable values
    are 'yes', 'no', and None.
    :return: 'yes' or 'no'
    """
    valid = {'y': 'yes', 'n': 'no'}
    if default is None:
        prompt = ' [y/n] '
    elif default == 'yes':
        prompt = ' [Y/n] '
    elif default == 'no':
        prompt = ' [y/N] '
    else:
        raise ValueError(f"Invalid default answer: '{default}'")

    choice = default

    while 1:
        user_input = input(question + prompt).lower()
        if not user_input:
            break
        try:
            choice = valid[user_input[0]]
            break
        except (KeyError, IndexError):
            print("Please respond with 'yes' or 'no' (or 'y' or 'n').\n")

    return choice


def print_batch_exception(batch_exception: batchmodels.BatchErrorException):
    """
    Prints the contents of the specified Batch exception.

    :param batch_exception:
    """
    print('-------------------------------------------')
    print('Exception encountered:')
    if batch_exception.error and \
            batch_exception.error.message and \
            batch_exception.error.message.value:
        print(batch_exception.error.message.value)
        if batch_exception.error.values:
            print()
            for mesg in batch_exception.error.values:
                print(f'{mesg.key}:\t{mesg.value}')
    print('-------------------------------------------')


def upload_file_to_container(blob_storage_service_client: BlobServiceClient,
                             container_name: str, file_path: str) -> batchmodels.ResourceFile:
    """
    Uploads a local file to an Azure Blob storage container.

    :param blob_storage_service_client: A blob service client.
    :param str container_name: The name of the Azure Blob storage container.
    :param str file_path: The local path to the file.
    :return: A ResourceFile initialized with a SAS URL appropriate for Batch
    tasks.
    """
    blob_name = os.path.basename(file_path)
    blob_client = blob_storage_service_client.get_blob_client(container_name, blob_name)

    print(f'Uploading file {file_path} to container [{container_name}]...')

    with open(file_path, "rb") as data:
        blob_client.upload_blob(data, overwrite=True)

    sas_token = generate_blob_sas(
        config.STORAGE_ACCOUNT_NAME,
        container_name,
        blob_name,
        account_key=config.STORAGE_ACCOUNT_KEY,
        permission=BlobSasPermissions(read=True),
        expiry=datetime.datetime.utcnow() + datetime.timedelta(hours=2)
    )

    sas_url = generate_sas_url(
        config.STORAGE_ACCOUNT_NAME,
        config.STORAGE_ACCOUNT_DOMAIN,
        container_name,
        blob_name,
        sas_token
    )

    return batchmodels.ResourceFile(
        http_url=sas_url,
        file_path=blob_name
    )


def generate_sas_url(
    account_name: str,
    account_domain: str,
    container_name: str,
    blob_name: str,
    sas_token: str
) -> str:
    """
    Generates and returns a sas url for accessing blob storage
    """
    return f"https://{account_name}.{account_domain}/{container_name}/{blob_name}?{sas_token}"


def create_pool(batch_service_client: BatchServiceClient, pool_id: str):
    """
    Creates a pool of compute nodes with the specified OS settings.

    :param batch_service_client: A Batch service client.
    :param str pool_id: An ID for the new pool.
    :param str publisher: Marketplace image publisher
    :param str offer: Marketplace image offer
    :param str sku: Marketplace image sku
    """
    print(f'Creating pool [{pool_id}]...')

    # Create a new pool of Linux compute nodes using an Azure Virtual Machines
    # Marketplace image. For more information about creating pools of Linux
    # nodes, see:
    # https://azure.microsoft.com/documentation/articles/batch-linux-nodes/
    new_pool = batchmodels.PoolAddParameter(
        id=pool_id,
        virtual_machine_configuration=batchmodels.VirtualMachineConfiguration(
            image_reference=batchmodels.ImageReference(
                publisher="canonical",
                offer="0001-com-ubuntu-server-focal",
                sku="20_04-lts",
                version="latest"
            ),
            node_agent_sku_id="batch.node.ubuntu 20.04"),
        vm_size=config.POOL_VM_SIZE,
        target_low_priority_nodes=config.POOL_NODE_COUNT,
        start_task=batchmodels.StartTask(
            command_line="/bin/bash -c \"sudo add-apt-repository -y \\\"deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted\\\" && sudo apt-get -y update && sudo apt-get -y install python3-pip && sudo pip3 install scapy && git clone https://github.com/henrikmotzkus/webtest.git\"",
            wait_for_success=True,
            user_identity=batchmodels.UserIdentity(
                auto_user=batchmodels.AutoUserSpecification(
                    elevation_level="admin",
                    scope="task"
                )
            )
        )
    )
    batch_service_client.pool.add(new_pool)


def create_job(batch_service_client: BatchServiceClient, job_id: str, pool_id: str):
    """
    Creates a job with the specified ID, associated with the specified pool.

    :param batch_service_client: A Batch service client.
    :param str job_id: The ID for the job.
    :param str pool_id: The ID for the pool.
    """
    print(f'Creating job [{job_id}]...')

    job = batchmodels.JobAddParameter(
        id=job_id,
        pool_info=batchmodels.PoolInformation(pool_id=pool_id))

    batch_service_client.job.add(job)


def add_tasks(batch_service_client: BatchServiceClient, job_id: str, resource_input_files: list):
    """
    Adds a task for each input file in the collection to the specified job.

    :param batch_service_client: A Batch service client.
    :param str job_id: The ID of the job to which to add the tasks.
    :param list resource_input_files: A collection of input files. One task will be
     created for each input file.
    """

    print(f'Adding {resource_input_files} tasks to job [{job_id}]...')

    tasks = []

    for idx, input_file in enumerate(resource_input_files):

        command = f"/bin/bash -c \"cat {input_file.file_path}\""
        tasks.append(batchmodels.TaskAddParameter(
            id=f'Task{idx}',
            command_line=command,
            resource_files=[input_file]
        )
        )

    batch_service_client.task.add_collection(job_id, tasks)

def add_tasks(batch_service_client: BatchServiceClient, job_id: str, number: int):
    """
    Adds a task with a fixed number

    :param batch_service_client: A Batch service client.
    :param str job_id: The ID of the job to which to add the tasks.
    :param number number of taks
    """

    print(f'Adding tasks to job [{job_id}]...')

    tasks = []

    for i in range (0, number):

        command = f"sudo python3 /mnt/batch/tasks/startup/wd/webtest/webtest.py"
        tasks.append(batchmodels.TaskAddParameter(
            id=f'Task{i}',
            command_line=command,
            user_identity=batchmodels.UserIdentity(
                auto_user=batchmodels.AutoUserSpecification(
                    elevation_level="admin",
                    scope="task"
                )
            )
        )
        )

    batch_service_client.task.add_collection(job_id, tasks)


def wait_for_tasks_to_complete(batch_service_client: BatchServiceClient, job_id: str,
                               timeout: datetime.timedelta):
    """
    Returns when all tasks in the specified job reach the Completed state.

    :param batch_service_client: A Batch service client.
    :param job_id: The id of the job whose tasks should be to monitored.
    :param timeout: The duration to wait for task completion. If all
    tasks in the specified job do not reach Completed state within this time
    period, an exception will be raised.
    """
    timeout_expiration = datetime.datetime.now() + timeout

    print(f"Monitoring all tasks for 'Completed' state, timeout in {timeout}...", end='')

    while datetime.datetime.now() < timeout_expiration:
        print('.', end='')
        sys.stdout.flush()
        tasks = batch_service_client.task.list(job_id)

        incomplete_tasks = [task for task in tasks if
                            task.state != batchmodels.TaskState.completed]
        if not incomplete_tasks:
            print()
            return True

        time.sleep(1)

    print()
    raise RuntimeError("ERROR: Tasks did not reach 'Completed' state within "
                       "timeout period of " + str(timeout))


def print_task_output(batch_service_client: BatchServiceClient, job_id: str,
                      text_encoding: str=None):
    """
    Prints the stdout.txt file for each task in the job.

    :param batch_client: The batch client to use.
    :param str job_id: The id of the job with task output files to print.
    """

    print('Printing task output...')

    tasks = batch_service_client.task.list(job_id)

    for task in tasks:

        node_id = batch_service_client.task.get(
            job_id, task.id).node_info.node_id
        print(f"Task: {task.id}")
        print(f"Node: {node_id}")

        stream = batch_service_client.file.get_from_task(
            job_id, task.id, config.STANDARD_OUT_FILE_NAME)

        file_text = _read_stream_as_string(
            stream,
            text_encoding)

        if text_encoding is None:
            text_encoding = DEFAULT_ENCODING

        sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = text_encoding)
        sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding = text_encoding)

        print("Standard output:")
        print(file_text)


def _read_stream_as_string(stream, encoding) -> str:
    """
    Read stream as string

    :param stream: input stream generator
    :param str encoding: The encoding of the file. The default is utf-8.
    :return: The file content.
    """
    output = io.BytesIO()
    try:
        for data in stream:
            output.write(data)
        if encoding is None:
            encoding = DEFAULT_ENCODING
        return output.getvalue().decode(encoding)
    finally:
        output.close()


if __name__ == '__main__':

    start_time = datetime.datetime.now().replace(microsecond=0)
    print(f'Sample start: {start_time}')
    print()

    # Create the blob client, for use in obtaining references to
    # blob storage containers and uploading files to containers.
    # blob_service_client = BlobServiceClient(
    #    account_url=f"https://{config.STORAGE_ACCOUNT_NAME}.{config.STORAGE_ACCOUNT_DOMAIN}/",
    #    credential=config.STORAGE_ACCOUNT_KEY
    #)

    # Use the blob client to create the containers in Azure Storage if they
    # don't yet exist.
    #input_container_name = 'input'      # pylint: disable=invalid-name
    #try:
    #    blob_service_client.create_container(input_container_name)
    #except ResourceExistsError:
    #    pass

    # The collection of data files that are to be processed by the tasks.
    #input_file_paths = [os.path.join(sys.path[0], 'taskdata0.txt'),
    #                    os.path.join(sys.path[0], 'taskdata1.txt'),
    #                    os.path.join(sys.path[0], 'taskdata2.txt')]

    # Upload the data files.
    #input_files = [
    #    upload_file_to_container(blob_service_client, input_container_name, file_path)
    #    for file_path in input_file_paths]

    # Create a Batch service client. We'll now be interacting with the Batch
    # service in addition to Storage
    credentials = SharedKeyCredentials(config.BATCH_ACCOUNT_NAME,
        config.BATCH_ACCOUNT_KEY)

    batch_client = BatchServiceClient(
        credentials,
        batch_url=config.BATCH_ACCOUNT_URL)

    try:
        # Create the pool that will contain the compute nodes that will execute the
        # tasks.
        create_pool(batch_client, config.POOL_ID)

        # Create the job that will run the tasks.
        create_job(batch_client, config.JOB_ID, config.POOL_ID)

        # Add the tasks to the job.
        add_tasks(batch_client, config.JOB_ID, config.TAKS_TO_START_COUNT)

        # Pause execution until tasks reach Completed state.
        wait_for_tasks_to_complete(batch_client,
                                   config.JOB_ID,
                                   datetime.timedelta(minutes=30))

        print("  Success! All tasks reached the 'Completed' state within the "
              "specified timeout period.")

        # Print the stdout.txt and stderr.txt files for each task to the console
        #print_task_output(batch_client, config.JOB_ID)

        # Print out some timing info
        end_time = datetime.datetime.now().replace(microsecond=0)
        print()
        print(f'Sample end: {end_time}')
        elapsed_time = end_time - start_time
        print(f'Elapsed time: {elapsed_time}')
        print()
        input('Press ENTER to exit...')

    except batchmodels.BatchErrorException as err:
        print_batch_exception(err)
        raise

    finally:
      # Clean up storage resources
      #  print(f'Deleting container [{input_container_name}]...')
      #  blob_service_client.delete_container(input_container_name)

        # Clean up Batch resources (if the user so chooses).
        if query_yes_no('Delete job?') == 'yes':
            batch_client.job.delete(config.JOB_ID)

        if query_yes_no('Delete pool?') == 'yes':
            batch_client.pool.delete(config.POOL_ID)