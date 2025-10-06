#!/bin/bash

# Base URL
base_url=$1
# Loop through episode numbers from 01 to 15
for ep in $(seq -w 1 15); do
    # Construct the full URL
    full_url="${base_url}Ep${ep}.1080p.mp4"
    
    # Output the result to the terminal
    echo "$full_url"
done
