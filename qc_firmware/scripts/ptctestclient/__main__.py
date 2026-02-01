from ptctestclient.comm import send_test_result
from ptctestclient.ptctests import dummy_client, temperature

import asyncio
import json
from websockets.asyncio.server import serve

# TODO set up logging for client

test_registry = {
    "dummy_test": dummy_client,
    "temperature": temperature
}

async def echo(ws):
    async for message in ws:
        print("Got Message")
        await ws.send(message)

async def run_test(ws):
    async for message in ws:
        try:
            test_info = json.loads(message) 
        except:
            print("Invalid JSON Payload")
        # TODO figure out a way to avoid blindly accessing parameters 
        # - some way to establish and communicate structure?
        test_params = test_info['test_params'] # type: ignore
        with test_registry[test_info['test_type']](**test_params) as t: # type: ignore
            print(f"Running Test {test_info['test_type']}") # type: ignore
            r = t.run_test()
            print(f"Test Result: {r}")
            await send_test_result(ws, test_info['test_type'], r)

async def main():
    async with serve(run_test, "localhost", 8765) as server:
        await server.serve_forever()

if __name__ == "__main__":
    asyncio.run(main())