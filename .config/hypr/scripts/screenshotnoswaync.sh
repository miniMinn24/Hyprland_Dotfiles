#!/bin/bash

swaync-client -cp
grim -g "$(slurp)" "$HOME/Pictures/Screenshots/$(date '+%y_%m_%d_%H-%M-%S').png"
swaync-client -op
