# Problemstatement

How to test the Azure Ddos protection with a self written attack tool

# Solution

Python script that sends SYN packets with the help of Azure batch jobs

# How to

1. Create a Azure batch account
2. Create a pool. Take a Ubuntu 22 LTS image. Size A1. Set the start task accordingly to file starttask.sh
3. Create a task for that pool. 


