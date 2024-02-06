#!/bin/sh

swayidle -w timeout 300 "dunstify -u critical 'Suspend!' '<span>About to lock the device.</span>'" \
  timeout 320 'swaylock' \
  timeout 400 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
  timeout 500 'systemctl suspend' \
  before-sleep 'swaylock' &
