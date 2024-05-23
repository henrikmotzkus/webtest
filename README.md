# Problemstatement

How to test the Azure Ddos protection with a self written attack tool

# Solution

Python script that sends an amount of SYN packets with the help of Azure batch jobs in order to trigger Ddos protection

# How to

0. Create a webservice that is the target of the Ddos attack. And protect it with a Ddos plan.
1. Create a Azure batch account in a different region from the region that us used by the target
2. git clone this repo
3. Change settings in config-template.py and remove the "-template" from the name.
4. Change the setting in webtestconfig-template.py and remove the "-template" from the name.
5. Rename file config-template.py to config.py
6. Install the required modules: pip install -r requirements.txt 
7. Run the python-client.py -> This will create a pool in azure batch and start the tasks 

# Further readings and sources of this project

https://github.com/Azure-Samples/azure-batch-samples
https://learn.microsoft.com/en-us/azure/ddos-protection/

