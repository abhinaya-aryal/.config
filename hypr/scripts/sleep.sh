#!/bin/sh

swayidle -w timeout 240 "dunstify -u critical 'Suspend!' '<span>About to lock in a minute.</span>'" \
  timeout 300 'swaylock' \
  timeout 320 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
  timeout 480 'systemctl suspend-then-hibernate' &
