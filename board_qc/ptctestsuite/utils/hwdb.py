import asyncio
import httpx
import aiofiles

from pathlib import Path

from ptctestsuite.utils.qc_record import qc_record
from ptctestsuite.utils.qc_result import qc_result
from ptctestsuite.config.parameters import ptc_part_type_id, bearer_token_path, dune_hwdb_api_path, local_cache_file

# rolling my own implementation for the HWDB here, since I see no need to pull in the entire library
# for what we need to do
# plus, I will have to write my own code to massage my own structures into the HWDB format,
# so might as well take the extra step to make a POST/GET request

bearer_token = None
with open(Path(bearer_token_path)) as bt:
    bearer_token = bt.read()

request_header = {"Authorization": f"Bearer {bearer_token}"}

# TODO take qc result or serial?
# we are NOT doing this - afaik the HWDB is structured in a way that makes this
# very expensive. We will store locally, and can spin up a REDIS instance in
# case we have multiple testers
"""
async def check_item_exists(item: qc_record) -> dict:
    # For this one, it looks like I have to get a list of hwitems matching the PTC Component type ID, parse the datasheet
    # and then check if an item with the serial already exists
    # Since we reference items by an ID assigned at upload time, there's no other way to do this it seems

    # first, let's craft our request
    p = f"{dune_hwdb_api_path}/component-types/{ptc_part_type_id}/components"
    async with httpx.AsyncClient() as client:
        r = await client.get(p, headers=request_header)
        p = r.json()
    
    # ok - now need to get the QC reports? unless serial goes in some other field
    
    # we know the structure from the wiki
    #parts = [i['component_id'] for i in p["data"]]


    return dict() 
"""

async def check_item_exists(item: qc_record) -> bool:
    serial_number = item.serial_number
    async with aiofiles.open(Path(local_cache_file), 'r') as f:
        existing_boards = [l.strip() async for l in f]
    if serial_number in existing_boards:
        return True
    return False

def create_item(item: qc_record) -> dict:
    # will return response from REST api
    return dict()

def upload_test_result(item: qc_record) -> dict:
    # will return response from REST api
    return dict()

def upload_ptc_image(item: qc_record, image) -> dict:
    # will return response from REST api
    return dict()