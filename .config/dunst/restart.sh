#!/usr/bin/env bash

pkill dunst
sleep 1s

source "$HOME/.cache/wal/colors.sh" # Source color scheme
dunst -lb "$color1" -nb "$color2" -hb "$color3" -lf "#000000" -mf "#000000" -bf "#000000" &
