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
RUN apk update && apk upgrade

RUN apk add --no-cache nginx openssl openrc openssh supervisor

VOLUME [ “/sys/fs/cgroup” ]

RUN	adduser -D 'gbroccol'; echo "gbroccol:password" | chpasswd;

RUN mkdir /www

COPY index.html /www/index.html
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /start.sh
COPY supervisor.conf /supervisor.conf

RUN openssl req -x509 -nodes -newkey rsa:2048 -days 365 \
	-keyout /etc/ssl/private/localhost.key \
	-out /etc/ssl/certs/localhost.crt \
	-subj "/C=RU/ST=MOSCOW/L=MOSCOW/O=school_21/CN=localhost"

RUN chmod +x start.sh

RUN mkdir -p /run/nginx
RUN mkdir -p /run/sshd
RUN chmod 744 /run/nginx
RUN chmod 744 /run/sshd

RUN mkdir -p /run/nginx

EXPOSE 80 443 22
ENTRYPOINT [ "/start.sh" ]
