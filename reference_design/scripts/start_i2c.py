import os
import sys
import time

os.system('poke 0x80020000 1')
print ('Taking I2C switch out of reset')
time.sleep(1)

os.system('i2cset -y -r 0 0x70 0x08')
print ('Selecting I2C switch for local sensor read')
time.sleep(1)

while(1):
    print ('SoC temp sensor is: ')
    os.system('i2cget -y 0 0x48 0x00 w')
    time.sleep(1)

    print ('Regulator temp sensor is: ')
    os.system('i2cget -y 0 0x49 0x00 w')
    time.sleep(1)

    print ('48V sensor is: ')
    os.system('i2cget -y 0 0x6e 0x1e')
    os.system('i2cget -y 0 0x6e 0x1f')
    time.sleep(1)

    print ('12V sensor is: ')
    os.system('i2cget -y 0 0x6d 0x1e')
    os.system('i2cget -y 0 0x6d 0x1f')
    time.sleep(1)