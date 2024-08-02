#!/bin/bash

CONFIG_PATH="$HOME/.config/wofi/"
FILE_PATH="$HOME/.config/wofi/style.css"
DARK_THEME="$HOME/.config/wofi/dark/style.css"
LIGHT_THEME="$HOME/.config/wofi/light/style.css"

dark() {
    /bin/rm -f "$FILE_PATH"
    /bin/cp "$DARK_THEME" "$FILE_PATH"
}

light() {
    /bin/rm -f "$FILE_PATH"
    /bin/cp "$LIGHT_THEME" "$FILE_PATH"
}

if [[ $1 == "light" ]]; then
    light
elif [[ $1 == "dark" ]]; then
    dark
else
    echo "Usage: $0 {light|dark}"
fi
