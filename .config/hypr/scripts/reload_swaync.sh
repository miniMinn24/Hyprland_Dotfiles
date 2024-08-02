#!/bin/bash
swaync-client -rs
swaync-client -R
notify-send -e -u low "Notification Daemon" "Swaync-client <b>Reloaded</b>"
