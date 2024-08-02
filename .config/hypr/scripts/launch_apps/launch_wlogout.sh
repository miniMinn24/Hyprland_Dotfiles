#!/bin/bash

if pgrep -x "wlogout" > /dev/null
then
    pkill -x "wlogout"
else
    wlogout &
fi