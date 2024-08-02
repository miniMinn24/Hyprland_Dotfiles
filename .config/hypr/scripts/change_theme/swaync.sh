#!/bin/bash

STYLE_FILE="$HOME/.config/swaync/style.css"

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
  swaync-client -rs
  swaync-client -R

}

if [[ $1 == "dark" ]]; then
    dark_theme
    reload
fi

if [[ $1 == "light" ]]; then
    light_theme
    reload
fi
