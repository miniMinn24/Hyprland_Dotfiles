#!/bin/bash

CONFIG_FILE=~/.config/hypr/hyprland.conf

# Extract the current value of the 'enabled' setting for blur
current_value=$(grep -E '^\s*enabled\s*=\s*[01]' $CONFIG_FILE | awk '{print $3}')

# Check if the current value is 0 or 1 and toggle it
if [ "$current_value" == "0" ]; then
    sleep 3
    sed -i 's/enabled = 0/enabled = 1/' $CONFIG_FILE
elif [ "$current_value" == "1" ]; then
    sed -i 's/enabled = 1/enabled = 0/' $CONFIG_FILE
    sleep 3
    sed -i 's/enabled = 0/enabled = 1/' $CONFIG_FILE
else
    echo "Current value of 'enabled' is not 0 or 1. Please check the configuration file."
    exit 1
fi

# Reload the Hyprland configuration
hyprctl reload
