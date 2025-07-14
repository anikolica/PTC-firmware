import os
import sys
import time

from voltage_tests import *
from temp_tests import *
from alert import *
from eeprom import *


#Meta information
sleep = 0.1
module = '5EV'

#Read Voltage Sensors for voltage and current
voltage_meter_test(IV_monitor_list)

#Read Temperature Sensors
temperature_sensor_test(temp_monitor_list)

#Ensure that FPGA can receive timing information over SFP

#Ensrue that basic network commands work over GbE SFP

#Ensure that basic EtherCAT communciations can be established over SFP

#Ensure that timing stream back to PTC (from WIB or custom PCB) is prioritized appropriately

#Assert ALARM lines from I2C sensors
sensor_alert_tests()
#SoM DDR memory burst test?

#Write/read on-board EEPROM (for serial number / MAC address)
    # Wait until I can get the Penn copy of the code 
    #get_EEPROM()

#Subset of QC-tested PTCs can be tested in full WEIC crate
