FROM alpine:3.12

#	COMMON
RUN 	apk update && apk add nginx wget \
		nginx php7-fpm php7-common php7-iconv php7-json php7-gd \
		php7-curl php7-xml php7-mysqli php7-imap php7-pdo php7-pdo_mysql \
		php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
		php7-ctype php7-dom php7-session php7-mbstring \
		php7-zlib libc6-compat php7-curl

RUN		apk add supervisor

#	NGINX
RUN		mkdir -p /run/nginx
RUN		mkdir -p /var/www/phpmyadmin
COPY	srcs/nginx.conf	/etc/nginx/conf.d/default.conf
COPY	srcs/supervisord.conf /etc/supervisord.conf
COPY	srcs/config.inc.php /var/www/phpmyadmin

#	PHPMYADMIN
RUN		wget  https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz && \
		tar -xf phpMyAdmin-5.0.2-all-languages.tar.gz && \
		rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
		mv -f phpMyAdmin-5.0.2-all-languages/* /var/www/phpmyadmin

RUN		mkdir -p /var/www/phpmyadmin/tmp
RUN		chmod -R 755 /var/www/phpmyadmin
RUN		chmod 644 /var/www/phpmyadmin/config.inc.php

COPY	srcs/phpmyadmin_start.sh	/tmp
#RUN		chmod 777 -R /var/lib/php7

EXPOSE	5000

CMD		sh /tmp/phpmyadmin_start.sh
