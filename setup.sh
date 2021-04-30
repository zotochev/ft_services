#!/bin/bash

minikube delete
minikube start --driver=virtualbox --cpus=4 --memory=4G --disk-size=10G

minikube addons enable metallb
eval $(minikube docker-env)

# new version of metallb. Use in case old one does not work
#docker pull metallb/speaker:v0.8.2
#docker pull metallb/controller:v0.8.2

minikube dashboard &
kubectl apply -f srcs/metallb/configmap.yaml
kubectl apply -f srcs/metallb/persistent_volume.yaml

# nginx
docker build -t nginx_image srcs/nginx
kubectl apply -f srcs/nginx/srcs/nginx.yaml

# mysql
docker build -t mysql_image srcs/mysql
kubectl apply -f srcs/mysql/srcs/mysql.yaml
kubectl apply -f srcs/mysql/srcs/mysql_pvc.yaml

# phpmyadmin
docker build -t phpmyadmin_image srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin/srcs/phpmyadmin.yaml

# wordpress
docker build -t wordpress_image srcs/wordpress
kubectl apply -f srcs/wordpress/srcs/wordpress.yaml

# ftps
docker build -t ftps_image srcs/ftps
kubectl apply -f srcs/ftps/srcs/ftps.yaml

# influxdb
docker build -t influxdb_image srcs/influxdb
kubectl apply -f srcs/influxdb/srcs/influxdb.yaml
kubectl apply -f srcs/influxdb/srcs/influxdb_pvc.yaml

# grafana
docker build -t grafana_image srcs/grafana
kubectl apply -f srcs/grafana/srcs/grafana.yaml
