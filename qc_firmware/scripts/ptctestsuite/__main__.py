import prompt_toolkit as ptk
from time import sleep
import asyncio
import json

from loguru import logger as lg

from prompt_toolkit.shortcuts import choice, message_dialog, input_dialog, confirm
from prompt_toolkit.filters import is_done

from ptctestsuite.ptctests import dummy_test
from ptctestsuite.utils import qc_result
from websockets.asyncio.client import connect


lg.remove()
lg.add("ptctests.log", rotation='500MB', level="INFO")

# keeping this for the entire run of the script
tester_name = ptk.prompt("Tester Name: ")

async def run_ptc_test():
    global tester_name 
    session = ptk.PromptSession()
    ptc_serial = await session.prompt_async("PTC Serial: ")
    lg.info(f"Starting new PTC Test Session. PTC Serial is {ptc_serial}")
    print("Running an example test.....")
    t = {"test_type": "dummy_test", "test_params": {}}
    async with connect("ws://localhost:8765") as ws:
        await ws.send(json.dumps(t))
        msg = await ws.recv()
        result = qc_result(int(msg))
        print(f"Test Result: {result}")
        #print(f"WS Message: {msg}")

if __name__ == "__main__":
    test_again = True
    while(test_again):
        asyncio.run(run_ptc_test())
        test_again = bool(confirm("Do you want to run another test?"))
