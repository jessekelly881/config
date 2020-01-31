#!/usr/bin/env bash

YEAR="$(date +'%Y')"
MONTH="$(date +'%m(%b)')"
DAY="$(date +'%d(%a)')"
TIME="$(date +'%T')"

FOLDER="$HOME/media/screenshots/$YEAR/$MONTH/$DAY"
FILE="$FOLDER/$TIME.jpg"
mkdir -p $FOLDER

case $@ in
    window)
        scrot -u "$FILE"
        ;;

    full)
        scrot "$FILE"
        ;;

    *)
        scrot "$FILE"
        ;;
    esac

notify-send "Screenshot" "Screen shot saved: $FILE"

# symlink for easy access
SYMLINK="$HOME/media/screenshots/last.jpg"
rm "$SYMLINK"
ln -s "$FILE" "$SYMLINK"
