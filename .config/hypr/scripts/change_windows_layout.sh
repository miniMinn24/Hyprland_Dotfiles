#!/bin/bash

CONFIG_FILE=~/.config/hypr/hyprland.conf
ORIGINAL_GAPS_OUT="20"
FOCUS_GAPS_OUT="0"

ORIGINAL_GAPS_IN="10"
FOCUS_GAPS_IN="0"

# Function to update the gaps_out value in the configuration file
update_gaps_out() {
    local new_value=$1
    sed -i "s/gaps_out =.*/gaps_out = $new_value/" "$CONFIG_FILE"
    echo "Set gaps_out to $new_value"
}

update_gaps_in() {
    local new_value=$1
    sed -i "s/gaps_in =.*/gaps_in = $new_value/" "$CONFIG_FILE"
    echo "Set gaps_in to $new_value"
}


# Get the current value of gaps_out
current_gapsOut=$(grep -E '^\s*gaps_out\s*=\s*' "$CONFIG_FILE" | awk -F ' = ' '{print $2}' | xargs)
current_gapsIn=$(grep -E '^\s*gaps_in\s*=\s*' "$CONFIG_FILE" | awk -F ' = ' '{print $2}' | xargs)

# Debug output
echo "Current gaps_out value: '$current_value'"

# Check the current value and toggle it
if [ "$current_gapsOut" == "$ORIGINAL_GAPS_OUT" ]; then
    update_gaps_out "$FOCUS_GAPS_OUT"
    update_gaps_in "$FOCUS_GAPS_IN"
    notify-send -h string:x-canonical-private-synchronous:sys-notify -e -u low "Hyprland" "Layout changed: <b>Focus Mode</b>"

elif [ "$current_gapsOut" == "$FOCUS_GAPS_OUT" ]; then
    update_gaps_out "$ORIGINAL_GAPS_OUT"
    update_gaps_in "$ORIGINAL_GAPS_IN"
    notify-send -h string:x-canonical-private-synchronous:sys-notify -e -u low "Hyprland" "Layout changed: <b>Simple Mode</b>"

else
    echo "Unexpected gaps_out value: '$current_value'. No changes made."
    exit 1
fi

# Reload Hyprland configuration
hyprctl reload
echo "Hyprland configuration reloaded"