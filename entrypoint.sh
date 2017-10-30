#!/bin/bash

BACKUPS_DIR=/backups

if [ ! -d "$BACKUPS_DIR" ]; then
  echo "Expected /backups directory to be mounted properly. Aborting!"
  exit 1
fi

echo "Setting crontab"
echo "0 0 14 1/1 * ? * root sh /workdir/run.sh >> /backups/crontab.log" > /etc/crontab
sh /workdir/run.sh >> /backups/crontab.log
tail -f /backups/crontab.log
