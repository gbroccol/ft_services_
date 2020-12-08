FROM	alpine:3.12
RUN		apk update && apk upgrade
RUN		apk add openrc

RUN		apk add nginx supervisor openssl openssh

RUN		adduser -D 'gbroccol'; echo "gbroccol:password" | chpasswd;

RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj '/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=gbroccol' \
		-keyout /etc/ssl/localhost.key \
		-out /etc/ssl/localhost.crt

RUN		mkdir www

COPY	./index.html /www/

COPY 	./nginx.conf /etc/nginx/conf.d/default.conf

COPY 	./supervisord.conf /etc/supervisord.conf

COPY 	./start.sh start.sh
RUN 	chmod +x start.sh

EXPOSE	80 443 22

CMD		[ "sh", "start.sh" ]
