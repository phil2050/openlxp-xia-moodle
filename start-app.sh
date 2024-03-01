#!/usr/bin/env bash
# start-server.sh

python manage.py waitdb 
python manage.py migrate 
cd /opt/app/ 
if [ -n "$TMP_SOURCE_DIR" ] ; then 
    (cd openlxp-xia-coursera; install -d -o www-data -p $TMP_SOURCE_DIR) 
else 
    (cd openlxp-xia-coursera; install -d -o www-data -p tmp/source) 
fi 
pwd 
service clamav-daemon restart 
./start-server.sh 
