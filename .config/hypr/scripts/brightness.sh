#!/bin/bash

# Get the current brightness level as a percentage
brightness=$(brightnessctl g)
max_brightness=$(brightnessctl m)
brightness_percent=$(( brightness * 100 / max_brightness ))

# Send a notification with the current brightness percentage
notify-send -h string:x-canonical-private-synchronous:sys-notify -e -u low "Brightness" "Current value: <b>${brightness_percent}%</b>"

