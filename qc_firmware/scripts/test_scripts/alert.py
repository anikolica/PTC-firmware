import os
import sys
import time

sleep = .1

#Check the alert register
def read_alerts (addr):
    try:
        i2c_raw = os.popen('i2cget -y 0 ' + addr + ' 0x02 ').read()
        #Convert the raw hex to an int
        read_set_reg = os.popen('i2cget -y 0 ' + addr + ' 0x20 w').read()
        print(i2c_raw)
        alert_byte = int(i2c_raw, 16)
        

        alert_messages = [
                'Minimum ADIN Alert',
                'Maximum ADIN Alert',
                'Minimum Vin Alert',
                'Maximum Vin Alert',
                'Mimimum Delta Sense Alert',
                'Maximum Delta Sense Alert',
                'Minimum Power Alert',
                'Maximum Power Alert',
                ]

        for i in range(len(alert_messages)):
            #Check if each bit to see if errors were asserted
            if (alert_byte >> i) & 1:
                print(alert_messages[i])
    except:
        print("Error reading alerts")

#Check the alerts for each IV Monitor
def sensor_alert_tests():
    component_list = ['0x67', '0x68', '0x69', '0x6a', '0x6b', '0x6c', '0x6d', '0x6e']

    #Set thresholds
    for addr in component_list:
        #Set max voltage to 5V
        os.system('i2cset -y 0 ' + addr + ' 0x24 0x00')
        os.system('i2cset -y 0 ' + addr + ' 0x25 0x01')
        print("Max voltage threshold set")
        #Set min voltage to 1V
        os.system('i2cset -y 0 ' + addr + ' 0x23 0x01')

        read_alerts(addr)
        time.sleep(sleep)
sensor_alert_tests()


