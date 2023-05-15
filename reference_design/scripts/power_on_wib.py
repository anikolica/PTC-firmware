import os
import sys

if sys.argv[2] == 'on':
    bit = '1'
elif sys.argv[2] == 'off':
    bit = '0'
else:
    bit = '0'

if sys.argv[1] == '0':
    addr = '0x80020010 '
elif sys.argv[1] == '1':
    addr = '0x80020014 '
elif sys.argv[1] == '2':
    addr = '0x80020018 '
elif sys.argv[1] == '3':
    addr = '0x8002001c '
elif sys.argv[1] == '4':
    addr = '0x80020020 '
elif sys.argv[1] == '5':
    addr = '0x80020024 '
else:
    addr = '0x800200fc '

os.system('poke ' + addr  + bit)
print ('Powering WIB ' + sys.argv[1] + ' ' + sys.argv[2])