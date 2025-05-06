#!/usr/bin/env bash

# This is to help if you try mounting a drive from a file manager and it fails for whatever reason

### not working, read isn't working properly yet
### while loop needs to be done better to account for more than one drive to be mounted (making the program interactive)
### we now need to specify the exact name of the device like sdb2 or whatever but I'd like to type anything specific to that line and in case of more than one line returned to prompt the user to select which one

lsblk | tee tempDevices.txt
input="sdb2"

while true; do 
	read -p "choose a device from the list: " input

	if [ -z "$input" ]; then
		input="sdb2"
	fi
	
	if grep "$input" tempDevices.txt; then
		echo "device found"
		break
	else
		echo "device not found, try again"
	fi
done


if [ ! -d "/run/media/kab/${input}" ]; then
	sudo mkdir /run/media/kab/${input}
fi

sudo mount  /dev/${input} /run/media/kab/${input}
rm ./tempDevices.txt

echo "Mounted Successfully"
