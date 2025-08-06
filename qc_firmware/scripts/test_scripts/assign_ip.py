import random
import os
import time
import subprocess

def assign_ip(EEPROM):
    #Generate random IP in private range
    octet2 = 168 
    octet3 = 43 
    octet4 = 0

    ip = f"192.{octet2}.{octet3}.{octet4}"
    interface = "eth1"

    try:
        #Use ip for newer systems
        #os.popen(f"ip addr flush dev {interface}")
        #os.popen(f"ip addr add {ip}/8 dev {interface}")
        #os.popen(f"ip link set {interface} up")
        
        #Older systems will support ifconfig commands
        subprocess.run(os.system(f'ifconfig {interface} {ip}'), shell=True, check=True) 
        time.sleep(.1)

        #Hardware poke and peak
        subprocess.run(os.system('poke 0xff0c0004 0x092e2c4a'), shell=True, check=True)
        print ('Bringing up eth1. GbE link state is: ')
        time.sleep(.1)
        subprocess.run(os.system('peek 0xff0c0200'), shell=True, check=True)
        print("EEPROM: " + str(EEPROM) + " assigned to IP address" + f" {ip}")
    except:
        print('Could not write new IP')

    
    return ip

assign_ip(24245)
