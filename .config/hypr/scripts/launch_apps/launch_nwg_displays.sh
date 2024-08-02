#!/bin/bash

if pgrep -x "nwg-displays" > /dev/null
then
    pkill -x "nwg-displays"
else
    nwg-displays &
fi