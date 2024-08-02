#!/bin/bash

EWW_STYLE_FILE="$HOME/.config/eww/colors.scss"

if [[ ! -f "$EWW_STYLE_FILE" ]]; then
  echo "Error: $EWW_STYLE_FILE not found!"
  exit 1
fi

eww_light_theme() {
    eww_new_theme="light.scss"
}
eww_dark_theme() {
    eww_new_theme="dark.scss"
}

waybar_dark_theme() {
  exec ~/.config/hypr/scripts/change_theme/waybar.sh dark & disown
}
waybar_light_theme() {
  exec ~/.config/hypr/scripts/change_theme/waybar.sh light & disown
}

dock_dark_theme() {
  exec ~/.config/hypr/scripts/change_theme/nwg_dock.sh dark & disown
}
dock_light_theme() {
  exec ~/.config/hypr/scripts/change_theme/nwg_dock.sh light & disown
}

wofi_dark_theme() {
  exec ~/.config/hypr/scripts/change_theme/wofi.sh dark &
}

wofi_light_theme() {
  exec ~/.config/hypr/scripts/change_theme/wofi.sh light &
}

swaync_dark_theme() {
  exec ~/.config/hypr/scripts/change_theme/swaync.sh dark &
}

swaync_light_theme() {
  exec ~/.config/hypr/scripts/change_theme/swaync.sh light &
}

gtk_dark_theme() {
  exec ~/.config/hypr/scripts/change_theme/gtk.sh dark &
}

gtk_light_theme() {
  exec ~/.config/hypr/scripts/change_theme/gtk.sh light &
}

wallpaper_dark() {
  swww img ~/Pictures/Wallpapers/for_script/Dark.jpg --transition-type any --transition-fps 60 --transition-duration 1.6
}
wallpaper_light() {
  swww img ~/Pictures/Wallpapers/for_script/Light.jpg --transition-type any --transition-fps 60 --transition-duration 1.6
}

reload_eww() {
    sed -i "s|@import \"themes/$current_eww_theme\";|@import \"themes/$eww_new_theme\";|g" "$EWW_STYLE_FILE"

    if pgrep -x "eww" > /dev/null; then
        eww reload
    fi 
}

current_eww_theme=$(grep -oP '@import "themes/\K[^"]+' "$EWW_STYLE_FILE")

if [[ $1 == "light" ]]; then
  notify-send -h string:x-canonical-private-synchronous:sys-notify -e -u low "Hyprland" "Changed to <b>Light Theme!</b>"
  eww_light_theme
  reload_eww
  waybar_light_theme
  dock_light_theme
  wofi_light_theme
  swaync_light_theme
  gtk_light_theme
  wallpaper_light
fi
if [[ $1 == "dark" ]]; then
  notify-send -h string:x-canonical-private-synchronous:sys-notify -e -u low "Hyprland" "Changed to <b>Dark Theme!</b>"
  eww_dark_theme
  reload_eww
  waybar_dark_theme
  dock_dark_theme
  wofi_dark_theme
  swaync_dark_theme
  gtk_dark_theme
  wallpaper_dark
fi
