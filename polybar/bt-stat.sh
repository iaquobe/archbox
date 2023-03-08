#/!bin/bash

connected_device="None"

for device in $(bluetoothctl devices | cut -d" " -f2)
do
	[ "$(bluetoothctl info "$device" \
		| grep Connected \
		| cut -d" " -f2)"  = "yes" ] \
		&& connected_device="$(bluetoothctl info "$device" \
		| grep Name \
		| cut -d" " -f2-)"
done

echo $connected_device
