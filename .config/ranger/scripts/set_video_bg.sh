#!/usr/bin/env bash

FILE="$@"
IMG_FILE="/tmp/bgvi.jpeg"

notify-send "Video BG" $FILE

yes | ffmpeg \
  -ss 00:01:00 \
  -i $FILE \
  -vframes 1 \
  $IMG_FILE


wal -i $IMG_FILE
xwinwrap -ov -fs -- mpv -vo=gpu -wid WID -no-audio -no-osd-bar -player-operation-mode=cplayer --hwdec=vaapi --no-osc --ab-loop-a=0:05 --ab-loop-b=3:00 --start=0:30 --no-correct-pts $FILE
