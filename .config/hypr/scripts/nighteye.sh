#!/bin/bash

# Checking the current temp color
current_temp=$(busctl --user -- get-property rs.wl-gammarelay / rs.wl.gammarelay Temperature | awk '{print $2}')

# Default color values
night_light_off_temp=8500
night_light_on_temp=3000

# Checking whether to turn on or off the Night light
if [ "$current_temp" -eq "$night_light_off_temp" ]; then
    # Turning On
    busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q "$night_light_on_temp"
    #notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$HOME/.config/hypr/icons/night_color.png" "Control Center" "Night color activated"
else
    # Turning Off
    busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q "$night_light_off_temp"
    #notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$HOME/.config/hypr/icons/cool_color.png" "Control Center" "Cool color activated"
fi
