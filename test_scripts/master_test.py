import os
import sys
import time
import csv
import pandas as pd

from voltage_tests import *
from temp_tests import *
from alert import *
from eeprom import *


#Meta information
sleep = 0.1
module = '5EV'


class PTC_Board:
    def __init__(serial, eeprom, ip):
        self.serial = serial
        self.eeprom = eeprom
        self.ip = ip

df = pd.DataFrame(columns=["Test", "Board", "EEPROM", "IP", "Component Address", "Data"])
#Write/read on-board EEPROM (for serial number / MAC address)
EEPROM_Serial, board_ip = get_EEPROM()

#Read Voltage Sensors for voltage and current
test_results = voltage_meter_test(IV_monitor_list)
for test in test_results:
    df.loc[len(df)] = [test[0],0, EEPROM_Serial, board_ip, test[1], test[2]]
#Read Temperature Sensors
temp_test_results = temperature_sensor_test(temp_monitor_list)

for test in temp_test_results:
    df.loc[len(df)] = [test[0],0, EEPROM_Serial, board_ip, test[1], test[2]]

#Ensure that FPGA can receive timing information over SFP

#Ensure that basic network commands work over GbE SFP

#Ensure that basic EtherCAT communciations can be established over SFP

#Ensure that timing stream back to PTC (from WIB or custom PCB) is prioritized appropriately

#Assert ALARM lines from I2C sensors
#sensor_alert_tests()

#SoM DDR memory burst test?


#Subset of QC-tested PTCs can be tested in full WEIC crate

print(df)
df.to_csv('output.csv', index=False)
