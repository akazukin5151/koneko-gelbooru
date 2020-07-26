# koneko-gelbooru

A rough and minimal example of how [koneko](https://github.com/twenty5151/koneko) can be modified for other purposes. Here, gelbooru is used as an example.

![preview](preview.png)

A diff file is automatically generated for convenience in [patch.diff](patch.diff).

# Installation

```sh
git clone https://github.com/twenty5151/koneko-gelbooru.git
cd koneko-gelbooru
./patcher.sh -c  # Short for --clone
cd build/koneko
python setup.py develop
```

Run with `koneko_gelbooru`, enter `1` and some gelbooru tags to search, comma separated. Pages aren't supported in this example yet. Also, the downloads are very slow because it is downloading the full resolutions.

# Develop

* Edit the files
* If needed, copy `.py` files from `koneko` to root and edit them
* Finally run `./patcher.sh`
    * Without the clone option, the patcher just moves the files
* Test with `koneko_gelbooru` (assuming it is already installed with `python setup.py develop`)

Finally, you should run `./patcher.sh -c` for a clean build plus patch. A diff file will also be generated.

# License notes

GPLv3. Note that [pygelbooru](https://github.com/FujiMakoto/pygelbooru/) is licensed under GPL.

