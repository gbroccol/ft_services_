# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbroccol <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/29 14:29:15 by gbroccol          #+#    #+#              #
#    Updated: 2020/06/29 14:29:15 by gbroccol         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer="gbroccol@student.21-school.com"

EXPOSE 80 443

# update			синхронизация и обновление индексных файлов пакетов
# upgrade			обновление всего установленного на данный момент софта в системе
# nginx				HTTP-сервер и обратный прокси-сервер, почтовый прокси-сервер
#					а также TCP/UDP прокси-сервер общего назначения

RUN apk update && apk upgrade && apk add nginx openssl

# # изменение конфигурационных файлов
# # wp-config.php			Wordpress
# RUN rm var/www/html/wordpress/wp-config-sample.php
# COPY srcs/wp-config.php ./var/www/html/wordpress

# default				nginx
COPY /srcs/default ./etc/nginx/conf.d/default

# #config.inc.php			PhpMyAdmin
# RUN rm var/www/html/phpmyadmin/config.sample.inc.php
# COPY srcs/config.inc.php ./var/www/html/phpmyadmin

# #MySQL
# COPY srcs/mysql.sql ./tmp
# RUN service mysql start && mysql -u root --password= < ./tmp/mysql.sql

# COPY srcs/autoindex.sh ./

# ssl
# req					генерация запросов на подпись сертификата
# -x509					генерируем самоподписанный сертификат
# -nodes				без пароля
# -newkey rsa:2048		если у нас ещё нет ключа,он будет создан автоматически
# -days 365				количество дней, в течении которых будет действовать данный сертификат
# -keyout /etc...		в какой файл положить ключ
# -out /etc...			сюда положим наш сертификат
# -subj					доп. параметры
RUN openssl req -x509 -nodes -newkey rsa:2048 -days 365 \
	-keyout /etc/ssl/private/localhost.key \
	-out /etc/ssl/certs/localhost.crt \
	-subj "/C=RU/ST=MOSCOW/L=MOSCOW/O=school_21/CN=localhost"

# RUN chown -R www-data /var/www/html/*
# RUN chmod -R 755 /var/www/html/*

# COPY /srcs/init.sh ./
# RUN chmod +x init.sh


CMD		nginx -g 'daemon off;';\
		sh
