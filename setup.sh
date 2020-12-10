#!/bin/sh

# starting kubernetes cluster
minikube start --vm-driver=virtualbox  

# enabling addons
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb
kubectl apply -f ./srcs/metallb-config.yaml

# Launch Docker inside minikube cluster
eval $(minikube docker-env)

# nginx container
printf "\n>> Nginx is building... \n"
docker build -t nginx_image ./srcs/nginx
echo "Done. "
kubectl apply -f ./srcs/nginx/nginx-deploy.yaml
kubectl apply -f ./srcs/nginx/nginx-service.yaml
echo -e "\x1b[1;35m*****Nginx is ready*****\n\x1b[0m"
															# kubectl get svc
															# kubectl delete svc nginx-service
															# kubectl get deploy
															# kubectl delete deploy nginx-deploy
# mysql container
printf "\n>> Mysql is building... \n"
docker build -t mysql_image ./srcs/mysql
echo "Done. "
kubectl apply -f ./srcs/mysql/mysql-pv.yaml
kubectl apply -f ./srcs/mysql/mysql-pvc.yaml
kubectl apply -f ./srcs/mysql/mysql-deploy.yaml
kubectl apply -f ./srcs/mysql/mysql-service.yaml
echo -e "\x1b[1;35m*****Mysql is ready*****\n\x1b[0m"
															# kubectl get pod
															# kubectl exec -it <pod-name> sh
															# kubectl get pv
															# kubectl get pvc
# wordpress container
printf "\n>> Wordpress is building ... \n"
docker build -t wp_image ./srcs/wordpress
echo "Done. "
kubectl apply -f ./srcs/wordpress/wordpress.yaml
echo -e "\x1b[1;35m*****Wordpress is ready*****\n\x1b[0m"

# phpmyadmin container
printf "\n>> PhpMyAdmin is building ... \n"
docker build -t php_image ./srcs/phpmyadmin
echo "Done. "
kubectl apply -f ./srcs/phpmyadmin/php.yaml
echo -e "\x1b[1;35m*****PhpMyAdmin is ready*****\n\x1b[0m"

# ftps container
printf "\n>> Ftps is building ... \n"
docker build -t ftps_image ./srcs/ftps
echo "Done. "
kubectl apply -f ./srcs/ftps/ftps-deploy.yaml
kubectl apply -f ./srcs/ftps/ftps-service.yaml
echo -e "\x1b[1;35m*****Ftps is ready*****\n\x1b[0m"

# telegraf metrics collector container
printf "\n>> Telegraf is building ... \n"
docker build -t telegraf_image ./srcs/telegraf
echo "Done. "
kubectl apply -f ./srcs/telegraf/telegraf-daemon.yaml
echo -e "\x1b[1;35m*****Telegraf is ready*****\n\x1b[0m"

# influxdb container - база, предназначенная для хранения временных рядов (time series)
printf "\n>> InfluxDB is building ... \n"
docker build -t influxdb_image ./srcs/influxdb
echo "Done. "
kubectl apply -f ./srcs/influxdb/influxdb-pv.yaml
kubectl apply -f ./srcs/influxdb/influxdb-pvc.yaml
kubectl apply -f ./srcs/influxdb/influxdb-deploy.yaml
kubectl apply -f ./srcs/influxdb/influxdb-service.yaml
echo -e "\x1b[1;35m*****InfluxDB is ready*****\n\x1b[0m"

# grafana container - для отображения метрик
printf "\n>> Grafana is building ... \n"
docker build -t grafana_image ./srcs/grafana
echo "Done. "
kubectl apply -f ./srcs/grafana/grafana-deploy.yaml
kubectl apply -f ./srcs/grafana/grafana-service.yaml
echo -e "\x1b[1;35m*****Grafana is ready*****\n\x1b[0m"

minikube dashboard
