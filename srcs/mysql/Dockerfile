FROM	alpine:3.12
RUN		apk update && apk upgrade
RUN		apk add openrc

RUN		apk add mysql mysql-client && \
		mkdir "/run/mysqld" && \
		chown -R mysql /run/mysqld

COPY start.sh /start.sh
RUN chmod +x start.sh

COPY create_db.sql /create_db.sql
COPY gbroccol.sql /gbroccol.sql
COPY	my.cnf /etc/my.cnf

RUN mkdir -p /run/openrc && touch /run/openrc/softlevel

EXPOSE 3306 
ENTRYPOINT [ "sh", "start.sh" ]