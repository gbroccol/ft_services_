FROM alpine:3.12
RUN apk update && apk upgrade

VOLUME [ “/sys/fs/cgroup” ]
# VOLUME [ “/sys/fs/cgroup” ]

# RUN apk add --no-cache mysql mysql-client 
RUN apk add mariadb mariadb-common mariadb-client openrc

RUN		mkdir "/run/mysqld" && \
		chown -R mysql /run/mysqld


# RUN mkdir "/run/mysqld" && chown -R mysql /run/mysqld

COPY start.sh /start.sh
RUN chmod +x start.sh

# COPY my.cnf /etc/
# RUN chmod +x /etc/my.cnf

COPY mysql_create.sql /mysql_create.sql
# RUN chmod +x mysql_create.sql

COPY gbroccol.sql /gbroccol.sql
# RUN chmod +x gbroccol.sql

RUN mkdir -p /run/openrc && touch /run/openrc/softlevel

EXPOSE 3306 
ENTRYPOINT [ "sh", "start.sh" ]