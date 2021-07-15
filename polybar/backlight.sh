#!/usr/bin/bash

light 2>&1 | grep "No backlight" -q || light
