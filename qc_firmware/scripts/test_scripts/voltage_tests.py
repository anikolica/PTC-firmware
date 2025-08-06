import os
import time
import sys

#Check with Godwin to verify the 0x67 repeats
IV_monitor_list = [('0x6E', 0.0025), ('0x67', 0.005), ('0x68', 0.005), ('0x69', 0.005), ('0x6A', 0.005), ('0x6B', 0.005), ('0x6C', 0.005), ('0x6D', 0.005)] 
sleep = 0.1

def read_volt(addr, resistor):
    try:
        i2c_raw = os.popen('i2cget -y 0 ' + addr + ' 0x1E w').read()
        # Right shift bc first 4 bits in reg are don't-cares
        i2c_dec = ((int((i2c_raw)[4:6],16) << 8) + int((i2c_raw)[2:4],16)) >> 4
        volts = i2c_dec * 0.025 # ADC conversion for LTC2945
        
        i2c_raw = os.popen('i2cget -y 0 ' + addr + ' 0x1 w').read()
        # See above
        i2c_dec = ((int((i2c_raw)[4:6],16) << 8) + int((i2c_raw)[2:4],16)) >> 4
        current = i2c_dec * 0.000025 / resistor
        print('Voltage sensor addr ' + str(addr) + ' reads ' + format(volts, '0.2f') + ' V at ' + format(curr, '0.2f') + ' A')
    except ValueError:
        print('Sensor ' + str(addr) + ' not readable')
        volts = float('nan')
        current = float('nan') 
    return volts, current


def voltage_meter_test(component_list):
    test_results = []
    for addr, resistor in component_list:
        volts, current = read_volt(addr, resistor)
        volt_data = ["Voltage", addr, str(volts) + " V"]
        test_results.append(volt_data)
        amp_data = ["Current", addr, str(current) + " A"]
        test_results.append(amp_data)
        time.sleep(sleep)
    return test_results
