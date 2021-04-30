FROM	alpine:3.12

#	COMMON
RUN		echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
        apk update && \
		apk add \
		influxdb \
		wget \
		supervisor \
		libc6-compat \
		telegraf

#	TELEGRAF
RUN		mkdir -p /etc/telegraf
RUN		/usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

#	INFLUXDB
COPY	srcs/influxdb.conf			/etc/influxdb.conf
COPY	srcs/supervisord.conf		/etc/supervisord.conf

VOLUME  ["/var/lib/influxdb"]

COPY	srcs/start_influxdb.sh		/tmp
RUN		chmod -R 755 tmp/start_influxdb.sh

EXPOSE	8086

CMD		sh /tmp/start_influxdb.sh
