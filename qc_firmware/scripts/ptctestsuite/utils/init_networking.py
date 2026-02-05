import asyncio
import serial_asyncio

from ptctestsuite.config import parameters
from loguru import logger as lg
import asyncssh

async def init_ptc(serial_port="/dev/ttyUSB0", baudrate=12800, timeout=1, ip_address = parameters.ptc_ip, debug_run = False) -> bool:
    if debug_run:
        return True
    try:
        line_end = r'\r\n'
        # in case we actually need UTF-8
        encoding = 'ascii'
        # sleep time between commands
        sleep_time = 2
        
        # establish a serial connection
        reader, writer = await serial_asyncio.open_serial_connection(url=serial_port, baudrate=baudrate, timeout=timeout)

        # log into the ptc
        writer.write(f"ptc{line_end}".encode(encoding))
        await writer.drain()
        await asyncio.sleep(sleep_time)

        # assign IP
        iface_str = f"ifconfig eth1 {ip_address} netmask 255.255.255.0{line_end}"
        writer.write(iface_str.encode(encoding))
        await writer.drain()
        await asyncio.sleep(sleep_time)

        # set correct bit to enable GbE
        writer.write(f"poke 0xff0c0004 0x092e2c4a{line_end}".encode('ascii'))
        await writer.drain()
        await asyncio.sleep(sleep_time)

        # close the writer
        writer.close()
        await writer.wait_closed()

        # successful init
        return True
    except:
        # something went wrong
        return False
    
async def start_client(debug_run=False) -> bool:
    if debug_run:
        return True

    try:
        async with asyncssh.connect(f"root@{parameters.ptc_ip}") as conn:
            await conn.run(f'source {parameters.ptc_client_path}/.env/bin/activate')
            await conn.run(f'python -m {parameters.ptc_client_path}')
    except asyncssh.Error as e:
        lg.error(f"SSH connection failed with error {e}!")
        return False
    return True
