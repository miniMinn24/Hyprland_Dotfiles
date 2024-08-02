#!/bin/bash
#  _   _           _       _              _   _       _   _ 
# | | | |_ __   __| | __ _| |_ ___  ___  | \ | | ___ | |_(_)
# | | | | '_ \ / _` |/ _` | __/ _ \/ __| |  \| |/ _ \| __| |
# | |_| | |_) | (_| | (_| | ||  __/\__ \ | |\  | (_) | |_| |
#  \___/| .__/ \__,_|\__,_|\__\___||___/ |_| \_|\___/ \__|_|
#       |_|                                      By miniMinn         

# Updating the local package database
sleep 10

wifi_status=$(nmcli radio wifi)

if [ "$wifi_status" = "enabled" ]; then
    sudo pacman -Sy > /dev/null 2>&1
    updates=$(checkupdates 2> /dev/null | wc -l)
    if [ "$updates" -gt 0 ]; then
        notify-send -h string:x-canonical-private-synchronous:sys-notify -e -u low "Updates Available" "New $updates packages can be updated."
    else
        notify-send -h string:x-canonical-private-synchronous:sys-notify -e -u low "No Updates" "I'm update to date :3"
    fi
else
    notify-send -h string:x-canonical-private-synchronous:sys-notify -e -u low "No WiFi" "WiFi disabled to check for updates."  
fi
