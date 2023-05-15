import os
import sys
import time

os.system('poke 0x80020004 0x00010400')
print ('Selecting PTC SFP as timing source, resetting endpoint')
time.sleep(1)

os.system('poke 0x80020004 0x00010000')
print ('Endpoint out of reset. Endpoint state is: ')
time.sleep(1)
os.system('peek 0x80020104')
time.sleep(1)

os.system('ifconfig eth1 192.168.200.12 up')
time.sleep(1)
os.system('poke 0xff0c0004 0x092e2c4a')
print ('Bringing up eth1. GbE link state is: ')
time.sleep(1)
os.system('peek 0xff0c0200')