#!/usr/bin/env bash

# Commands that are usable both on the terminal and as a script
if tty -s
then
    alias select="fzf --height 40% --color=bw --reverse"
    alias msg="echo"
else
    alias select="rofi -dmenu"
    alias msg="notify-send"
fi
