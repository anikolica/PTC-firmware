import os
import sys
import time

# Need to starup the SoM stuff (the EEPROM)

#Let the windows computer know what the IP address is
ip_addr = '192.168.200.' + str(input('Enter the ip ending for this board: '))

#Ping the SoM
try:
	os.system('ping ' + ip_addr)
except:
	print('Error pinging the SoM')

#SSH into the SoM
os.system(f'ssh root@{ip_addr} "bash -l -c \'python3 ptc_board_tests/firmware_master.py\'"')

#GbE throughput test
os.system('dd if=/dev/zero bs=1M count=1000 status=progress | ssh root@' + ip_addr + ' "dd of=/dev/null bs=1M"')
