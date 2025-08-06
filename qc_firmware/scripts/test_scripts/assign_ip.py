import random
import os
import time
import subprocess

def assign_ip(EEPROM):
    #IP in private range
    octet2 = 168 
    octet3 = 200 
    octet4 = input("Enter the PTC number: ") 

    ip = f"192.{octet2}.{octet3}.{octet4}"
    interface = "eth1"

    try:
        #Use ip for newer systems
            #os.popen(f"ip addr flush dev {interface}")
            #os.popen(f"ip addr add {ip}/8 dev {interface}")
            #os.popen(f"ip link set {interface} up")
        
        #Older systems will support ifconfig commands
        os.system(f'ifconfig {interface} {ip} up') 
        time.sleep(.1)

        #Hardware poke and peak
        #Unlike i2c, the address is already known, so poke [reg_addr] [data]
        os.system('poke 0xff0c0004 0x092e2c4a')
        print ('Bringing up eth1. GbE link state is: ')
        time.sleep(.1)
        #Similar to poke, have peek [reg_addr]
        os.system('peek 0xff0c0200')
        print("EEPROM: " + str(EEPROM) + " assigned to IP address" + f" {ip}")
    except:
        print(f'Could not write new IP {ip}')

    
    return ip

