#!/bin/bash

LIGHT_THEME="WhiteSur-Light"
DARK_THEME="Materia-dark"

change_theme() {
    local theme_name=$1
    nwg-look -x  # Export current settings
    sed -i "s/^gtk-theme=.*/gtk-theme=$theme_name/" ~/.local/share/nwg-look/gsettings
    nwg-look -a  # Apply settings
}

if [[ $1 == "light" ]]; then
    change_theme $LIGHT_THEME
elif [[ $1 == "dark" ]]; then
    change_theme $DARK_THEME
else
    echo "Usage: $0 {light|dark}"
    exit 1
fi

echo "GTK theme changed to $1"
