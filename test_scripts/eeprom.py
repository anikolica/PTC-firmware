import os
import sys
import time

sleep = .1
#module = '5EV'
#if module == '2EG'
#    base_addr = '0xa003'
#else:
#    base_addr = '0x8002'
#
#os.system('poke ' + base_addr + '0000 0x00000201')
#print ('Taking I2C switches out of reset')
#time.sleep(sleep)
#
#os.system('i2cset -y -r 0 0x70 0x08')
#print ('Selecting I2C switch for local sensor read')
#time.sleep(sleep)
#
## Set up bus 1 on WIB, and clear FEM bias sensor to prep for read
## NOTE: Need to enable 10MHz clock on WIB before reading WIB I2C busses
#os.system('i2cset -y 2 0x3d 0x00 0x01')
#os.system('i2cget -y 2 0x4e 0x1d').read()
#os.system('i2cget -y 2 0x4e 0x1c').read()
#print ('Selecting I2C switch for local sensor read')
#time.sleep(sleep)

def get_EEPROM():
    i2c_raw = os.popen('i2cget -y 0 0xa0 0xfa i 6')
    EEPROM_Serial = int(i2c_raw, 16)
    time.sleep(sleep)
