#!/bin/bash

snip_screenshot() {
    grim -g "$(slurp)" "$HOME/Pictures/Screenshots/$(date '+%y_%m_%d_%H-%M-%S').png"
}

full_screenshot() {
    grim "$HOME/Pictures/Screenshots/$(date '+%y_%m_%d_%H-%M-%S').png"
}

if [[ "$1" == "snip" ]]; then
    snip_screenshot
elif [[ "$1" == "full" ]]; then
    full_screenshot
fi