#!/bin/bash

# Get RAM usage in GB
RAM_TOTAL=$(free -h | grep Mem | awk '{print $2}')
RAM_USED=$(free -h | grep Mem | awk '{print $3}')

# Output the RAM usage and total RAM
echo "RAM: $RAM_USED / $RAM_TOTAL"