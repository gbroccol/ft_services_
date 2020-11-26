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

EXPOSE 80 443 22


# update			синхронизация и обновление индексных файлов пакетов
# upgrade			обновление всего установленного на данный момент софта в системе
# nginx				HTTP-сервер и обратный прокси-сервер, почтовый прокси-сервер
#					а также TCP/UDP прокси-сервер общего назначения

RUN apk update && apk upgrade && apk add --no-cache nginx openssl openssh 
# supervisor

# RUN ssh-keygen -A

# default				nginx
# COPY default ./etc/nginx/conf.d/default

# RUN mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www && mkdir /run/nginx


#COPY default ./etc/nginx/conf.d/default
COPY default /etc/nginx/nginx.conf
COPY index.html ./www/index.html
# COPY supervisord.conf /etc/supervisord.conf

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

RUN mkdir -p /run/nginx

# CMD		/usr/bin/supervisord -c /etc/supervisord.conf

CMD		nginx -g 'daemon off;';\
		sh
