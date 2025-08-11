import os
import sys
import time
import csv
#import pandas as pd

from voltage_tests import *
from temp_tests import *
from alert_assert import *
from eeprom import *


#Meta information
sleep = 0.1
module = '5EV'


class PTC_Board:
    def __init__(serial, eeprom, ip):
        self.serial = serial
        self.eeprom = eeprom
        self.ip = ip
#IMPORTANT: FOR MAIN PTC THE SWITCHES NEED PULLED OUT OF RESET DOES NOT APPLY FOR QC
module = '5EV'
if module == '2EG':
    base_addr = '0xa003'
else:
    base_addr = '0x8002'

os.system('poke ' + base_addr + '0000 0x00000201')
print('Taking I2C switches out of reset')
time.sleep(sleep)

os.system('i2cset -y -r 0 0x70 0x08')
print('Selecting I2C switch for local sensor read')
time.sleep(sleep)

#Write/read on-board EEPROM (for serial number / MAC address)
EEPROM_Serial = get_EEPROM()

#Read Voltage Sensors for voltage and current
test_results = voltage_meter_test(IV_monitor_list)

#Read Temperature Sensors
temp_test_results = temperature_sensor_test(temp_monitor_list)

#Ensure that FPGA can receive timing information over SFP

#Ensure that basic network commands work over GbE SFP

#Ensure that basic EtherCAT communciations can be established over SFP

#Ensure that timing stream back to PTC (from WIB or custom PCB) is prioritized appropriately

#Assert ALARM lines from I2C sensors
check_alert()

#SoM DDR memory burst test?


#Subset of QC-tested PTCs can be tested in full WEIC crate


