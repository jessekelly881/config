#!/usr/bin/env bash

DATE="$(date +'%F')"
TIME="$(date +'%T')"

FOLDER="$HOME/media/screenshots/$DATE"
FILE="$FOLDER/$TIME.jpg"
mkdir $FOLDER

scrot "$FILE"
notify-send "Screenshot" "Screen shot saved: $FILE"

# symlink for easy access
SYMLINK="$HOME/media/screenshots/last.jpg"
rm "$SYMLINK"
ln -s "$FILE" "$SYMLINK"
