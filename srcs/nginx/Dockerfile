FROM 	alpine:3.12

#	COMMON
RUN 	apk update && \
		apk add nginx \
				openssl \
				supervisor

RUN		openssl req \
		-x509 -nodes -days 365 \
		-newkey rsa:2048 \
		-keyout /etc/ssl/nginx.key \
		-out /etc/ssl/nginx.crt \
		-subj "/C=RU/ST=RT/L=Kazan/O=21School/OU=IT/CN=localhost"

#	NGINX
COPY	srcs/default			/etc/nginx/conf.d/default.conf
RUN		rm -rf /var/lib/nginx/html/index.html
COPY	srcs/index.html			/var/lib/nginx/html
COPY	srcs/supervisord.conf	/etc/supervisord.conf

COPY	srcs/nginx_start.sh		/tmp
RUN		chmod +x /tmp/nginx_start.sh
RUN		mkdir -p /run/nginx
RUN		mkdir -p /var/log/nginx

EXPOSE	80 443
CMD		sh /tmp/nginx_start.sh


