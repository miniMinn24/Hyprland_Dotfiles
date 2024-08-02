#!/bin/bash

if pgrep -x "window" > /dev/null
then
    eww close window
else
    eww open window &
fi