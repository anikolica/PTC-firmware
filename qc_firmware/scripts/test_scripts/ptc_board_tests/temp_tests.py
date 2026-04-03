import os
import time

temp_monitor_list = ['0x48', '0x49', '0x4A', '0x4B']
sleep = 0.1

def read_temp(addr):
    try:
        #Read the temperature register 'word'
        i2c_raw = os.popen('i2cget -y 0 ' + addr + ' 0x00 w').read()
        #i2cget gives byte-swapped output
        i2c_dec =((int((i2c_raw)[4:6],16) << 8) + int((i2c_raw)[2:4],16))
        #Note that two's comp can give neg temp - should never see on PTC
        temp = i2c_dec * 00.0078125 #conversion to degC on TMP117
        print('Temp sensor addr ' + str(addr) + ' reads ' + format(temp, '0.1f') + ' C')
    except ValueError:
        #Print error if something goes wrong
        print('Sensor ' + str(addr) + ' not readable')
        temp = float('nan')
    return temp

def temperature_sensor_test(component_list):
    test_results = []

    #Check the temp of each monitor in list
    for addr in component_list:
        temp = read_temp(addr)
        temp_reading = ["Temp", addr, str(temp) + " C"] 
        #Add the result to results list
        test_results.append(temp_reading)
        time.sleep(sleep)
    return test_results
