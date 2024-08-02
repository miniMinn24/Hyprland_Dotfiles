#!/bin/bash
# ---This script is still in implementation---
# A script that hides nwg-dock-hyprland when an app is in Fullscreen, automatically.

# Check if any windows are in full-screen mode
while true; do
    if hyprctl clients | grep -q "fullscreen: 1"; then
        pkill -f nwg-dock-hyprland
    else
        if ! pgrep -x "nwg-dock-hyprland" > /dev/null; then
            sh ~/.config/hypr/scripts/nwg_dock_launch.sh &
        fi
    fi
    sleep 2
done