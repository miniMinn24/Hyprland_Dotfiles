#!/bin/bash

current_status=$(swaync-client -D)


enable_dnd () {
  swaync-client -d  
}

disable_dnd () {
  swaync-client -d
}

get_state () {
  if [ "$current_status" == "false" ]; then
    echo off
  else
    echo on
  fi
}

toggle () {
  if [ "$current_status" == "false" ]; then
    enable_dnd
    echo true
  else
    disable_dnd
    echo false
  fi
}

if [[ $1 == "enable" ]]; then
  enable_dnd
fi

if [[ $1 == "disable" ]]; then
  disable_dnd
fi

if [[ $1 == "toggle" ]]; then
  toggle
fi

if [[ $1 == "state" ]]; then
  get_state
fi