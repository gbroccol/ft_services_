FROM alpine:3.12
RUN apk update && apk upgrade 

RUN apk add --no-cache mysql mysql-client openrc

# RUN mkdir "/run/mysqld" && chown -R mysql /run/mysqld

COPY start.sh /start.sh
RUN chmod +x start.sh

# # COPY my.cnf /etc/
# # RUN chmod +x /etc/my.cnf

# # COPY mlsite.sql mlsite.sql
# # RUN chmod +x mlsite.sql

# # RUN openrc default

EXPOSE 3306 
ENTRYPOINT [ "sh", "start.sh" ]