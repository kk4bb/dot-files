#!/usr/bin/env bash

#nothing to see here
nohup env LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify-launcher > /dev/null 2>&1 & disown
