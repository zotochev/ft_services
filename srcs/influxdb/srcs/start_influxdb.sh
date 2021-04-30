#!/bin/sh

/usr/bin/supervisord -c /etc/supervisord.conf

#influx -precision rfc3339
#
#echo "CREATE DATABASE telegraf;"
#echo "CREATE USER test WITH PASSWORD 'test';"
#echo "USE telegraf;"
