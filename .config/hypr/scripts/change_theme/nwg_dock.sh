#!/bin/bash

STYLE_FILE="$HOME/.config/nwg-dock-hyprland/style.css"
LAUNCH_DOCK="~/.config/hypr/scripts/launch_apps/launch_nwg_dock.sh"

if [[ ! -f "$STYLE_FILE" ]]; then
  echo "Error: $STYLE_FILE not found!"
  exit 1
fi

current_theme=$(grep -oP '@import "themes/\K[^"]+' "$STYLE_FILE")

dark_theme() {
  new_theme="dark.css"
}
light_theme() {
  new_theme="light.css"
}
reload() {
  sed -i "s|@import \"themes/$current_theme\";|@import \"themes/$new_theme\";|g" "$STYLE_FILE"

  if pgrep -f "nwg-dock-hyprland" > /dev/null; then
    pkill -f "nwg-dock-hyprland"
  fi

  # Start nwg-dock-hyprland as a background process
  exec "$LAUNCH_DOCK"   
}

if [[ $1 == "dark" ]]; then
    dark_theme
    reload
fi

if [[ $1 == "light" ]]; then
    light_theme
    reload
fi

