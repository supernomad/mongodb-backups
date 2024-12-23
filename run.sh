#!/bin/bash

MONGO_HOST=`cat /workdir/MONGO_HOST.env`
MONGO_DB=`cat /workdir/MONGO_DB.env`
BACKUPS_GS_BUCKET=`cat /workdir/BACKUPS_GS_BUCKET.env`
DATE_STR=`date +%Y-%m-%d-%H-%M`
TARGET_FILENAME=mongo-$MONGO_DB-$DATE_STR
TARGET_PATH=/workdir/data/$TARGET_FILENAME

echo $DATE_STR > /workdir/data/backup.date
mongodump --uri="$MONGO_HOST" -d $MONGO_DB -o $TARGET_PATH
tar cfzv $TARGET_PATH.tar.gz $TARGET_PATH
rm -rf $TARGET_PATH
gsutil cp $TARGET_PATH.tar.gz gs://$BACKUPS_GS_BUCKET/$TARGET_FILENAME.tar.gz
if [ ! $? -eq 0 ]; then
    echo "Error copying file to Google Storage!!"
    exit 1
fi
rm -f $TARGET_PATH.tar.gz
gsutil cp /workdir/data/backup.date gs://$BACKUPS_GS_BUCKET
