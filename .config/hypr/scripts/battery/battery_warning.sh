#!/bin/bash
# @requires: mplayer, brightnessctl

# Delay for startup
sleep 5

# Change your sound path here
SOUND_FILE="$(dirname "$(readlink -f "$0")")/sounds/default_sound.mp3"

playsound() {
    mplayer "$SOUND_FILE"
}

sendNotification() {
    local message="$1"
    notify-send -h string:x-canonical-private-synchronous:sys-notify -e -u critical "Battery Low!" "$message"
}

notify_count=0

while true; do
    Battery_Status="$(cat /sys/class/power_supply/BAT*/status)"
    Battery_Capacity=$(cat /sys/class/power_supply/BAT*/capacity)

    if [ "$Battery_Status" == "Discharging" ] && [ "$Battery_Capacity" -le 14 ]; then
        if [ "$notify_count" -eq 0 ]; then
            sendNotification "Power running out: <b>${Battery_Capacity}%</b>"
            playsound
            notify_count=$((notify_count + 1))
            sleep 180

        elif [ "$notify_count" -eq 1 ]; then
            sendNotification "<b>Save your works</b> before immediate shutdown."
            playsound
            notify_count=$((notify_count - 1))
            sleep 180
        fi
    else
        notify_count=0
        sleep 120
    fi
done
