FROM	alpine:3.12

#	COMMON
RUN		apk update && \
		apk add libc6-compat

#	GRAFANA
RUN		wget --directory-prefix=/opt https://dl.grafana.com/oss/release/grafana-7.5.2.linux-amd64.tar.gz

RUN		tar -xzf /opt/grafana-7.5.2.linux-amd64.tar.gz --directory /opt && \
		mv /opt/grafana-7.5.2 /opt/grafana && \
		rm -rf /opt/grafana-7.5.2.linux-amd64.tar.gz && \
		mkdir -p /opt/grafana/data/log

COPY	srcs/grafana.db			/opt/grafana/data
COPY	srcs/start_grafana.sh	/tmp

EXPOSE	3000

CMD		sh /tmp/start_grafana.sh
