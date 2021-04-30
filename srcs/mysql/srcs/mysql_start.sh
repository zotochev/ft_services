#!/bin/sh

/usr/bin/mariadb-install-db -u root
/usr/bin/mysqld -u root & sleep 5

mysql -u root -e "create database wordpress_db;"
mysql -u root -e "create user 'admin'@'%' identified by 'admin';"
mysql -u root -e "grant all privileges on *.* to 'admin'@'%' identified by 'admin' with grant option; use wordpress_db;"
mysql -u root -e "flush privileges"
mysql -u root -e "USE wordpress_db;"
mysql -u root wordpress_db < wordpress_db_sample.sql

/usr/bin/supervisord -c /etc/supervisord.conf
