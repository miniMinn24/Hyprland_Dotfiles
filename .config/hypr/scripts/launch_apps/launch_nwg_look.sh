#!/bin/bash

if pgrep -x "nwg-look" > /dev/null
then
    pkill -x "nwg-look"
else
    nwg-look &
fi