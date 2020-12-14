FROM		alpine:3.12
RUN			apk update && apk upgrade
RUN			apk add openrc

RUN			apk add vsftpd openssl

COPY		start.sh /start.sh
RUN			chmod +x start.sh

RUN     	adduser -D -h /ftp_data gbroccol; echo "gbroccol:password" | chpasswd
RUN			mkdir -p /ftp_data
COPY		welcome /ftp_data
COPY    	vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN 		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
			-subj '/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=gbroccol' \
			-keyout /etc/ssl/private/vsftpd.key \
			-out /etc/ssl/certs/vsftpd.crt

EXPOSE		21 50021
ENTRYPOINT	[ "sh", "start.sh" ]