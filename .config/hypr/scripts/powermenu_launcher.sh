#!/bin/bash

# Check if Rofi is currently running
if pgrep -x "rofi" > /dev/null; then
    # Rofi is running, so kill the process
    pkill -x rofi
else
    # Rofi is not running, so launch it
    sh $HOME/.config/rofi/powermenu/powermenu.sh
fi
