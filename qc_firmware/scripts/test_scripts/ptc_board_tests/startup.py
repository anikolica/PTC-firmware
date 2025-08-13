import os
import sys
import time

from alert_assert import *
from eeprom import *

#
module = '5EV'
if module == '2EG':
	base_addr = '0xa003'
else:
	base_addr = '0x8002'

#Wakeup the I2C switch 
os.system('poke ' + base_addr + '0000 0x00000201')
print('Taking I2C switches out of reset')
time.sleep(sleep)

#Select which part of I2C bus
os.system('i2cset -y -r 0 0x70 0x08')
print('Selecting I2C switch for local sensor read')
time.sleep(sleep)

#Configure the ethernet connection for 9kb 'jumbo packets'
os.system('ifconfig eth1 down')
os.system('ifconfig eth1 mtu 9000')
os.system('ifconfig eth1 up')

#Set ip
EEPROM_Serial = get_EEPROM()


