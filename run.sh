#!/bin/bash

DATE_STR=`date +%y%m%d-%H%M`
TARGET_FILENAME=mongo-$MONGO_DB-$DATE_STR
TARGET_PATH=/workdir/$TARGET_FILENAME

mongodump -h $MONGO_HOST -d $MONGO_DB -o $TARGET_PATH
tar cfzv $TARGET_PATH.tar.gz $TARGET_PATH
rm -rf $TARGET_PATH
gc cp $TARGET_PATH.tar.gz gs://$BACKUPS_GS_BUCKET/$TARGET_FILENAME.tar.gz
rm -f $TARGET_PATH.tar.gz
