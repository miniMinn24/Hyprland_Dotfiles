#!/bin/bash

hyprctl switchxkblayout at-translated-set-2-keyboard next
# notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$HOME/.config/hypr/icons/keyboard.png" "Control Center" "Keyboard layout has changed"