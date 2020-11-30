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
EXPOSE 80 443 22
# update			синхронизация и обновление индексных файлов пакетов
# upgrade			обновление всего установленного на данный момент софта в системе
# nginx				HTTP-сервер и обратный прокси-сервер, почтовый прокси-сервер
#					а также TCP/UDP прокси-сервер общего назначения
RUN apk update && apk upgrade && apk add --no-cache nginx openssl openssh supervisor
RUN mkdir /www

COPY index.html /www/
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /start.sh
COPY supervisor.conf /supervisor.conf

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

RUN chmod +x start.sh

RUN mkdir -p /run/nginx

ENTRYPOINT [ "/start.sh" ]
