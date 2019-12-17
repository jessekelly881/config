#!/usr/bin/env bash
set -x

# this will create daily folders and sync to them.
# after a full week it will begin to sync over folders from last week
# this gives a nice incrimental backup along side a synced backup.
DAY=$(date +'%w-%a')
BUCKET="s3://jesse-backup/$DAY/"

s3cmd sync -r ~/docs $BUCKET >  ~/.backup-log
notify-send "Backup" "Backup completed"





# currently only backing up docs folder
# this script needs expanded to sync everything.
# say everyting in ~/.config/sync
