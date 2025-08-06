import os
import sys
import time
import random
from assign_ip import *

sleep = .1

def get_EEPROM():
    try:
        i2c_raw = os.popen('i2cget -y 0 0xa 0xfa i 6')
        #EEPROM_Serial = int(str(i2c_raw), 16)
        EEPROM_Serial = 23432342
        board_ip = assign_ip(EEPROM_Serial)
    except ValueError:
        print('EEPROM not readable')
    time.sleep(sleep)
    
    return EEPROM_Serial, board_ip
