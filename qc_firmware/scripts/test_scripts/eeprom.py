import os
import sys
import time
import random
from assign_ip import *

sleep = .1

def get_EEPROM():
    try:
        #Use i2c too look at the eeprom and 6 bytes from address 0xfa (see datasheet)
        i2c_raw = os.popen('i2cget -y 0 0x50 0xfa i 6').read()
        #String manipulation to convert 6 bytes to a string of ints
        reduced = ''.join(b[2:] for b in i2c_raw.split())
        EEPROM_Serial = int(reduced , 16)
        print("EEPROM Serial Number: " + str(EEPROM_Serial))
        #Use this EEPROM to assign a local ip
        board_ip = assign_ip(EEPROM_Serial)
    except ValueError:
        #If you cannot access the EEPROM it is not readable
        print('EEPROM not readable')
        EEPROM_Serial = -1 
        time.sleep(sleep)
    
    return EEPROM_Serial

