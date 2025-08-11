import os
import time
import sys

sleep = 0.1
module = '5EV'
FPGA_addr = '0x77'

def check_alert():
    #List of IV Monitors
    component_list = ['0x67', '0x68', '0x69', '0x6a', '0x6b', '0x6d', '0x6e']

    #Error messages for IV registers
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

    #Error messages for Reg 666
    reg_alert_messages = [
            'VP48_IV_ALERT',
            'OVER_TEMP',
            'VP3V3_ALERT',
            'VP2V5_ALERT',
            'VP12_IV_ALERT'
            ]

    #Test each sensor in list
    for addr in component_list:
        try:
            print()
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

            #String manipulation to print the register in clusters of 4 bits
            #alert_reg = ' '.join(alert_reg[i : i+4] for i in range(0, 32, 4))
            #print(alert_reg)
        except:
            print('Could not access the register')
        
    
    #Check register 66 of FPGA (steps of 4, so 4 * 66 = 264 => 108, and then minus 4 because fencepost error) 
    i2c_raw = os.popen('peek 0x80020104').read()
    alert_reg = int(i2c_raw, 16) 
    #Convert to 32 bit binary string
    alert_reg = format(alert_reg, '032b')
    
    #Reverse the string to use indices like LSBs
    reverse_alert_reg = alert_reg[::-1]
    reg_alert_list = []
    #Collecting the error information from key bits
    VP_48_IV_ALERT = reverse_alert_reg[24]
    reg_alert_list.append(VP_48_IV_ALERT)

    OVER_TEMP = reverse_alert_reg[16:18]
    reg_alert_list.append(OVER_TEMP)

    VP3V3_ALERT = reverse_alert_reg[9]
    reg_alert_list.append(VP3V3_ALERT)
    
    VP2V5_ALERT = reverse_alert_reg[8]
    reg_alert_list.append(VP2V5_ALERT)

    VP12_IV_ALERT = reverse_alert_reg[0:6]
    reg_alert_list.append(VP12_IV_ALERT)

    #Check each element to see if alert was asserted
    print(addr + " has the following errors: ")
    for i, error in enumerate(reg_alert_list):
        if('0' in error): 
            print(reg_alert_messages[i])

