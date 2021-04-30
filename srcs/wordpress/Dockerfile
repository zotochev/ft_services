FROM alpine:3.12

#	COMMON
RUN 	apk update && \
		apk add \
		nginx wget curl supervisor \
		php7 php7-fpm php7-opcache php7-gd php7-iconv \
		php7-mysqli php7-mbstring php7-json php7-session \
		php7-xml php7-ctype

#	NGINX
RUN		mkdir -p /run/nginx
COPY	srcs/nginx.conf /etc/nginx/conf.d/default.conf

COPY	srcs/supervisord.conf /etc/supervisord.conf

#	WORDPRESS
RUN		curl https://wordpress.org/wordpress-5.6.tar.gz --output wordpress.tar.gz && \
		tar -xf wordpress.tar.gz && \
		rm wordpress.tar.gz && \
		mv -f wordpress /var/www/wordpress

COPY	srcs/wp-config.php /var/www/wordpress

EXPOSE	5050

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
