import shutil
import asyncio

import funcy
import requests
from pygelbooru import Gelbooru


class APIHandler:
    def __init__(self):
        self.gelbooru = Gelbooru()

    @funcy.retry(tries=3, errors=ConnectionError)
    def search_posts(self, tags) -> 'Json':
        """User input are in comma separated strings, need to be list[str]"""
        taglist = tags.split(',')
        return asyncio.run(self.gelbooru.search_posts(tags=taglist, exclude_tags=['nude']))

    # Download
    @funcy.retry(tries=3, errors=ConnectionError)
    def protected_download(self, url, path, name) -> 'IO':
        r = requests.get(url, stream=True)
        with open(path / name, 'wb') as f:
            shutil.copyfileobj(r.raw, f)


myapi = APIHandler()
