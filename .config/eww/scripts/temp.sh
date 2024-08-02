#!/bin/bash

# Get the current temperature using the sensors command
current_temp=$(sensors | grep 'Package id 0:' | awk '{print $4}' | tr -d '+°C' | cut -d. -f1)

# Print the current temperature without the decimal point
echo "${current_temp}"
