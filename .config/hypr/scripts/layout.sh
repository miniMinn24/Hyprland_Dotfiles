#!/bin/bash
# Note: This script only checks for 2 only languages: Burmese and English.
#       But, you can implement to check for more layouts, it's Ez.

# Dependencies: jq, gojq.
current_lang=$(hyprctl devices -j | gojq -r '.keyboards[] | select(.name == "at-translated-set-2-keyboard") | .active_keymap' | cut -c 1-2 | tr 'A-Z' 'a-z')

# Prints the current Layout in Waybar
if [ "$current_lang" = "en" ]; then
    echo "en"
elif [ "$current_lang" = "bu" ]; then
    echo "mm"
fi
