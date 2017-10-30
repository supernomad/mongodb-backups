#!/bin/bash

DATE_STR=`date +%y%m%d-%H%M`
mongodump -h $MONGO_HOST -d $MONGO_DB -o /backups/mongo-$MONGO_DB-$DATE_STR
