import os
import time
import sys

sleep = 0.1
module = '5EV'
FPGA_addr = '0x77'

#Alert pin will be asserted

#Intentionally set the voltage to something out of bounds

#Check the register on the FPGA to see if it was actually asserted/sent

#Use peek (get) and poke (set) to look at FPGA
#Addresses are in implemented view in vivado
"""
The alert pins are stored in reg 66 from 0 to 6
"""

def check_alert():
    component_list = ['0x67', '0x68', '0x69', '0x6a', '0x6b', '0x6d', '0x6e']

    for addr in component_list:
        try:
            #Set minimum voltage to 20V
            os.system('i2cset -y 0 ' + addr + ' 0x22 0x14')
            time.sleep(sleep)
            #Check the alert register
            i2c_raw = os.popen('i2cget -y 0 ' + FPGA_addr + ' 0x42')
            alert_reg = bin(i2c_raw)
        except:
            print('Could not access the register')
        

check_alert()
