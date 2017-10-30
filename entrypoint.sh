#!/bin/bash

if ! gsutil ls gs://$BACKUPS_GS_BUCKET > /dev/null; then
    echo "Expected valid storage bucket at BACKUPS_GS_BUCKET"
    exit 1
fi

echo "Setting crontab"
echo "0 0 14 1/1 * ? * root sh /workdir/run.sh >> /workdir/crontab.log" > /etc/crontab
sh /workdir/run.sh >> /backups/crontab.log
tail -f /backups/crontab.log
