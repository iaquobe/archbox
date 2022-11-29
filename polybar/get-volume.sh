#!/bin/bash

pactl get-sink-volume @DEFAULT_SINK@ \
	| head -1 \
	| cut -d / -f2 \
	| tr -d " "
