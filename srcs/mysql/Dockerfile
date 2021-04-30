FROM	alpine:3.12

#	COMMON
RUN		apk update
RUN		apk upgrade
RUN		apk add mariadb \
				mariadb-client \
				supervisor

#	MARIADB
RUN		mkdir -p /run/mysqld

VOLUME	["/var/lib/mysql"]
VOLUME	["/sys/fs/cgroup"]

COPY	/srcs/supervisord.conf			/etc/supervisord.conf
COPY	/srcs/mariadb-server.cnf		/etc/my.cnf
COPY	/srcs/wordpress_db_sample.sql	/
COPY	/srcs/mysql_start.sh			/


EXPOSE	3306
CMD		sh mysql_start.sh
