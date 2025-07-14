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


#Check the alert register
def read_alerts (addr):
    try:
        i2c_raw = os.popen('i2cget -y 0 ' + addr + ' 0x01 ').read()
        #Convert the raw hex to an int
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
        os.system('i2cset -y 0 ' + addr + ' 0x21 0x05')
        #Set min voltage to 1V
        os.system('i2cset -y 0 ' + addr + ' 0x23 0x01')

    for addr in ['0x67', '0x68', '0x69', '0x6a', '0x6b', '0x6c', '0x6d', '0x6e']:
        read_alerts(addr)
        time.sleep(sleep)



