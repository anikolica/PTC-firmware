import os
import sys
import time
import csv
import pandas as pd

class PTC_Board:
    #Constructor
    def __init__(serial, eeprom, ip):
        self.serial = serial
        self.eeprom = eeprom
        self.ip = ip

    #Get the EEPROM Number and assign an IP
    def assign_ip(EEPROM):
        #Generate random IP in private range
        octet2 = 168
        octet3 = 43
        octet4 = 0

        ip = f"192.{octet2}.{octet3}.{octet4}"
        interface = "eth1"
        
        try:
            #In newer systems
            #os.popen(f"ip addr flush dev {interface}")
            #os.popen(f"ip addr add {ip}/8 dev {interface}")
            #os.popen(f"ip link set {interface} up"

            #Older systems with ifconfig support
            subprocess.run(os.system(f'ifconfig {interface} {ip}'), shell=True, check=True)
            time.sleep(0.1)
            
            #Hardware poke and peak
            subprocess.run(os.system('poke 0xff0c0004 0x092e2c4a'), shell=True, check=True)
            print('Bringing up eth1. GbE link state is: ')
            time.sleep(0.1)
            subprocess.run(os.system('peek 0xff0c0200'), shell=True, check=True)
            print("EEPROM: " + str(EEPROM) + " assigned to IP address" + f" {ip}")
        except:
            print('Could not write new IP')

        return ip

    def get_EEPROM():
        try:
            i2c_raw = os.popen('i2cget -y 0 0xa 0xfa i 6')
            #EEPROM_Serial = int(str(i2c_raw), 16)
            EEPROM_Serial = 486842
            board_ip = assign_ip(EEPROM_Serial)
        except ValueError:
            print('EEPROM not readable')

        time.sleep(sleep)

        return EEPROM_Serial, board_ip


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


    def voltage_meter_test():
        test_results = []
         #Check with Godwin to verify the 0x67 repeats
        IV_monitor_list = [('0x6E', 0.0025), ('0x67', 0.005), ('0x68', 0.005), ('0x69', 0.005), ('0x6A', 0.005), ('0x6B', 0.005), ('0x6C', 0.005), ('0x6D', 0.005)]

        for addr, resistor in component_list:
            volts, current = read_volt(addr, resistor)
            volt_data = ["Voltage", addr, str(volts) + " V"]
            test_results.append(volt_data)
            amp_data = ["Current", addr, str(current) + " A"]
            test_results.append(amp_data)
            time.sleep(sleep)
        return test_results
                                                                                                                                                                                
                                    

   
