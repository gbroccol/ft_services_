FROM	alpine:3.12
RUN		apk update && apk upgrade
RUN		apk add openrc

RUN		apk add --no-cache	nginx supervisor \
							php7 php7-fpm php7-opcache \
							php7-gd php7-mysqli php7-zlib php7-curl \
							php7-mbstring php7-json php7-session

RUN		mkdir -p /www/

COPY	start.sh /start.sh
RUN		chmod +x start.sh

RUN     wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
        tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
        rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
        mv phpMyAdmin-5.0.2-all-languages /www/phpmyadmin

COPY 	nginx.conf /etc/nginx/conf.d/default.conf
COPY    config.inc.php /www/phpmyadmin/
COPY 	supervisord.conf /etc/supervisord.conf

EXPOSE 5000 
ENTRYPOINT [ "sh", "start.sh" ]