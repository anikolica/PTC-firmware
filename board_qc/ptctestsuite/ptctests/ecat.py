import os
import sys
import time


# TODO set up global logging infrastructure
# TODO remove old 2eg module code


base_addr_2eg = '0xa003'
base_addr_5ev = '0x8002'
sleep_time = 1

volt_adc_conversion = 0.025
current_adc_conversion = 0.000025

module = '5EV'
base_addr = base_addr_5ev
ecat_initalized = False

# TODO find actual target values
target_volt = 12.0 #volts
target_curr = 0.5 #amps

# utility functions
def char_to_raw(data: str, length: int) -> str:
    """Converts one of 16 hex char to raw bytes for UART.
    Note: bytes are send in reverse order on UART line,
    but I2C read is reversed also.

    Args:
        data (str): The data to be converted into raw bytes
        length (int): The length to convert 

    Returns:
        str: A string representation of the corresponding raw bytes
    """
    # NOTE: it's not cleare to me why the length argument is necessary -
    # we can use len(data) instead - maybe to do with how many
    # bytes we expect?
    output = ""
    for x in range (0, length):
        if x == 0 or x == 2:
            output += r"\x" + data[x]
        if x == 1 or x == 3:
            output += data[x]
    return output

def select_module(module_id: str) -> bool:
    """Select which ethercat module to use

    Args:
        module_id (str): The module ID

    Returns:
        bool: Status code. Returns False if an invalid module ID was passed
    """
    global module
    global base_addr
    global ecat_initalized

    match module_id:
        case '2EG':
            # if a valid module is passed
            # select the new module id
            # update the base addr, and
            # set ethercat as uninitalized
            module = module_id
            base_addr = base_addr_2eg
            ecat_initalized = False
            return True
        case '5EV':
            module = module_id
            base_addr = base_addr_5ev 
            ecat_initalized = False
            return True
        case _:
            return False

def ecat_init() -> bool:
    """Initializes ethercat

    Returns:
        bool: Status Code
    """
    global ecat_initalized
    global base_addr

    try:
        os.system('poke ' + base_addr + '0000 0x00000201')
        print("Taking I2C Switches Out Of Reset")
        time.sleep(sleep_time)

        os.system('i2cset -y -r 0 0x70 0x08')
        print ('Selecting I2C switch for local sensor read')
        time.sleep(sleep_time)

        ecat_initalized = True
        return True
    except:
        return False

# TODO potentiall homogenize the read functions?

def read_temp(addr: str) -> str:
    """Reads temperature of I2C Bus

    Args:
        addr (str): I2C Address Of Sensor

    Returns:
        str: Temperature reading
    """
    global ecat_initalized
    global base_addr
    
    if not ecat_initalized:
        return ""

    try:
        i2c_raw = os.popen('i2cget -y 0 ' + addr + ' 0x00 w').read()
        raw_word = char_to_raw(i2c_raw[2:6], 4)
        # i2cget gives byte-swapped output
        i2c_dec =((int((i2c_raw)[4:6],16) << 8) + int((i2c_raw)[2:4],16))
        #Note that two's comp can give neg temp - should never see on PTC
        temp = i2c_dec * 0.0078125 #conversion to degC on TMP117
        string = 'Temp sensor addr ' + str(addr) + ' reads raw value: ' + i2c_raw + ' which is temp: ' + format(temp, '0.1f') + ' C\n'
    except Exception as e:
        string = 'Sensor ' + str(addr) + ' not readable\n'
        raw_word = char_to_raw('adde', 4)
    return raw_word


def read_volt (addr):
    global ecat_initalized
    global base_addr
    global volt_adc_conversion
    try:
        i2c_raw = os.popen('i2cget -y 0 ' + addr + ' 0x1e w').read()
        raw_word = char_to_raw(i2c_raw[2:6], 4)
        # Right shift bc first 4 bits in reg are don't-care
        i2c_dec =((int((i2c_raw)[4:6],16) << 8) + int((i2c_raw)[2:4],16)) >> 4
        volts = i2c_dec * volt_adc_conversion
        string = 'Voltage sensor addr ' + str(addr) + ' reads raw value: ' + i2c_raw + ' which is voltage: ' + format(volts, '0.1f') + ' V\n'
    except Exception as e:
        string = 'Sensor ' + str(addr) + ' not readable\n'
        raw_word = char_to_raw('adde', 4)
    return raw_word

def read_curr (addr, resistor):
    try:
        i2c_raw = os.popen('i2cget -y 0 ' + addr + ' 0x14 w').read()
        raw_word = char_to_raw(i2c_raw[2:6], 4)
        # Right shift bc first 4 bits in reg are don't-care
        i2c_dec =((int((i2c_raw)[4:6],16) << 8) + int((i2c_raw)[2:4],16)) >> 4
        curr = i2c_dec * current_adc_conversion / resistor # ADC conversion for LTC2945 / resistor value
        string = 'Voltage sensor addr ' + str(addr) + ' reads raw value: ' + i2c_raw + ' which is current: ' + format(curr, '0.2f') + ' A\n'
        print (string)
    except Exception as e:
        string = 'Sensor ' + str(addr) + ' not readable\n'
        print (string)
        raw_word = char_to_raw('adde', 4)
    return raw_word

