#!/usr/bin/env bash
# 0 */2 * * * . ~/.config/backup.sh

set -x

# music
MUSIC_BUCKET="s3://jesse-music/"
MUSIC_FOLDER="$HOME/media/music"
# s3cmd sync -r $MUSIC_FOLDER $MUSIC_BUCKET >>  ~/.backup-log
