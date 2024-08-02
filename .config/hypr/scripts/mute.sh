#!/bin/bash

# Checking current state
volume_status=$(amixer sget Master | grep -o "\[on\]" || echo "[off]")

if [ "$volume_status" = "[off]" ]; then
    # Slient mode: OFF
    pactl set-sink-mute @DEFAULT_SINK@ toggle
else
    # Slient mode: ON
    pactl set-sink-mute @DEFAULT_SINK@ toggle
fi
