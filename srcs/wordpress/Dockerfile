FROM	alpine:3.12
RUN		apk update && apk upgrade
RUN		apk add openrc

RUN		apk add --no-cache	nginx supervisor \
							php7 php7-fpm php7-mysqli \ 
							php7-zlib php7-curl php7-mbstring \
							php7-json php7-session

RUN		mkdir -p /www/

COPY	start.sh /start.sh
RUN		chmod +x start.sh

RUN     wget https://wordpress.org/latest.zip && \
		unzip latest.zip && \
		mv wordpress /www/ && \
		rm latest.zip

COPY 	nginx.conf /etc/nginx/conf.d/default.conf
COPY	wp-config.php /www/
COPY 	supervisord.conf /etc/supervisord.conf

EXPOSE 5050 
ENTRYPOINT [ "sh", "start.sh" ]