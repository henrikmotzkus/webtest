"""
Configure Batch and Storage Account credentials
"""

BATCH_ACCOUNT_NAME = ''  # Your batch account name
BATCH_ACCOUNT_KEY = ''  # Your batch account key
BATCH_ACCOUNT_URL = ''  # Your batch account URL
STORAGE_ACCOUNT_NAME = ''
STORAGE_ACCOUNT_KEY = ''
STORAGE_ACCOUNT_DOMAIN = 'blob.core.windows.net' # Your storage account blob service domain

POOL_ID = 'Pool_500'  # Your Pool ID
POOL_NODE_COUNT = 500  # Pool node count
TAKS_TO_START_COUNT = 500  # Idealy number of nodes
POOL_VM_SIZE = 'STANDARD_A1_V2'  # VM Type/Size
JOB_ID = 'Job_500'  # Job ID
STANDARD_OUT_FILE_NAME = 'stdout.txt'  # Standard Output file