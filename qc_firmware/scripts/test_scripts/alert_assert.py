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

    alert_messages = [
            'Minimum ADIN Alert',
            'Maximum ADIN Alert', 
            'Minimum Vin Alert',
            'Maximum Vin Alert',
            'Minimum Delta Sense Alert',
            'Maximum Delta Sense Alert',
            'Minimum Power Alert',
            'Maximum Power Alert'
            ]

    for addr in component_list:
        try:
        #Set maximum voltage to 1V
            os.system('i2cset -y 0 ' + addr + ' 0x24 0x00')
            os.system('i2cset -y 0 ' + addr + ' 0x25 0x01')
            print("Wrote max threshold to 1")
            time.sleep(sleep)
        #Check that the alert register in the IV device was asserted
            i2c_raw = os.popen('i2cget -y 0 ' + addr + ' 0x02').read()
            alert_byte = int(i2c_raw, 16)
            for i in range(len(alert_messages)):
            #Check each bit to see if errors were asserted
                if((alert_byte >> i) & 1):
                    print(alert_messages[i])
        #Check register 66 of FPGA (steps of 4, so 4 * 66 = 264 => 108, and then minus 4 because fencepost error) 
            i2c_raw = os.popen('peek 0x80020104').read()
            alert_reg = int(i2c_raw, 16) 
            #String manipulation to print the register in clusters of 4 bits
            alert_reg = format(alert_reg, '032b')
            alert_reg = ' '.join(alert_reg[i : i+4] for i in range(0, 32, 4))
            print(alert_reg)
        except:
            print('Could not access the register')
        

