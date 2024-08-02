#!/bin/bash

# Path to the temporary file and lock file
TEMP_FILE="/tmp/brightness_widget_timer"
LOCK_FILE="/tmp/brightness_widget_lock"
CFG="$HOME/.config/eww"

# Duration to keep the widget open in seconds
DURATION=3

# Function to show the volume widget
show_widget() {
    eww -c "$CFG" open brightness_bar  # Replace with the actual command to show your widget

}

# Function to hide the volume widget
hide_widget() {
    if eww -c "$CFG" list-windows ; then
        eww -c "$CFG" close brightness_bar # Replace with the actual command to hide your widget
    fi
}

# Check if another instance of the script is running
if [[ -f "$LOCK_FILE" ]]; then
    # Update the timestamp and exit
    echo $(date +%s) > $TEMP_FILE
    exit 0
fi

# Create the lock file
touch $LOCK_FILE

# Record the current time in the temporary file
echo $(date +%s) > $TEMP_FILE

# Show the widget
show_widget

# Loop to check if the keybind is pressed within the duration
while true; do
    sleep 0.1
    if [[ ! -f $TEMP_FILE ]]; then
        break
    fi
    
    LAST_PRESS=$(cat $TEMP_FILE)
    CURRENT_TIME=$(date +%s)
    ELAPSED_TIME=$((CURRENT_TIME - LAST_PRESS))
    
    if [[ $ELAPSED_TIME -ge $DURATION ]]; then
        hide_widget
        rm -f $TEMP_FILE
        break
    fi
done

# Remove the lock file
rm -f $LOCK_FILE
