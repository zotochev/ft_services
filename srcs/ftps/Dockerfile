FROM	alpine:3.7

#	COMMON
RUN		apk update && apk add vsftpd openssl supervisor

RUN		openssl req \
		-x509 -nodes -days 365 \
		-newkey rsa:2048 \
		-keyout /etc/ssl/private/vsftpd.key \
		-out /etc/ssl/certs/vsftpd.crt \
		-subj "/C=RU/ST=RT/L=Kazan/O=21School/OU=IT/CN=localhost"

#	FTPS
RUN 	mkdir -p /ftps && chmod 755 /ftps && \
		adduser -D admin -h /ftps && \
		chown admin:admin /ftps && \
		echo "admin:admin" | chpasswd

COPY	/srcs/supervisord.conf	/etc/supervisord.conf
COPY	/srcs/vsftpd.conf		/etc/vsftpd
RUN		chmod -R 755 /etc/vsftpd && chmod 755 /etc/vsftpd/vsftpd.conf
COPY	/srcs/ftps_start.sh		.

VOLUME	/ftps
VOLUME	/var/log/vsftpd

EXPOSE	20 21000

CMD		sh ftps_start.sh
