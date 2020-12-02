#!/bin/sh

# starting kubernetes cluster
# minikube start \
# 		--driver=virtualbox --cpus=2 --memory='3000' --disk-size='20000mb' \
# 		--host-only-cidr='192.168.99.1/24' \
minikube start --vm-driver=virtualbox  

# enabling addons
# minikube addons enable metrics-server
# minikube addons enable dashboard
minikube addons enable metallb

# configuration ip pool
kubectl apply -f ./srcs/metallb-config.yaml
# creating memberlist secret
# kubectl create secret generic -n metallb-system memberlist \
# 		--from-literal=secretkey="$(openssl rand -base64 128)"

# building containers
# eval $(minikube -p minikube docker-env)
eval $(minikube docker-env)

# nginx container
printf "\n>> Nginx is building... \n"
docker build -t nginx_image ./srcs/nginx
echo "Done. "
kubectl apply -f ./srcs/nginx/nginx.yaml

                                # kubectl get svc
                                # kubectl delete svc nginx-service
                                # kubectl get deploy
                                # kubectl delete deploy nginx-deployment

# mysql container
printf "\n>> Mysql is building... \n"
docker build -t mysql_image ./srcs/mysql
echo "Done. "
kubectl apply -f ./srcs/mysql/mysql.yaml

# wordpress container
printf "\n>> Wordpress is building ... \n"
docker build -t wp_image ./srcs/wordpress
echo "Done. "
kubectl apply -f ./srcs/wordpress/wordpress.yaml

# phpmyadmin container
printf "\n>> PhpMyAdmin is building ... \n"
docker build -t php_image ./srcs/phpmyadmin
echo "Done. "
kubectl apply -f ./srcs/phpmyadmin/php.yaml

minikube dashboard

# # ftps container
# printf "\n>> Ftps is building ... \n"
# docker build -t ftps ./srcs/ftps
# echo "Done. "
# kubectl apply -f ./srcs/yaml-deploy/ftps-deploy.yaml
# kubectl apply -f ./srcs/yaml-service/ftps-service.yaml

# # influxdb container
# printf "\n>> InfluxDB is building ... \n"
# docker build -t influxdb ./srcs/influxdb
# echo "Done. "
# kubectl apply -f ./srcs/yaml-storage/influxdb-storage.yaml
# kubectl apply -f ./srcs/yaml-deploy/influxdb-deploy.yaml
# kubectl apply -f ./srcs/yaml-service/influxdb-service.yaml

# # telegraf metrics collector container
# printf "\n>> Telegraf is building ... \n"
# docker build -t telegraf ./srcs/telegraf
# echo "Done. "
# kubectl apply -f ./srcs/telegraf/telegraf-daemon.yaml

# # grafana container
# printf "\n>> Grafana is building ... \n"
# docker build -t grafana ./srcs/grafana
# echo "Done. "
# kubectl apply -f ./srcs/yaml-deploy/grafana-deploy.yaml
# kubectl apply -f ./srcs/yaml-service/grafana-service.yaml