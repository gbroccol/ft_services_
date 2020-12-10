# Grafana - для отображения метрик
FROM	alpine:3.12
RUN		apk update && apk upgrade
RUN		apk add openrc

RUN apk add --no-cache grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

COPY srcs/grafana.ini /etc/grafana.ini

RUN mkdir /provisioning
COPY srcs/provisioning /usr/share/grafana/conf/provisioning

RUN mkdir dashboards
COPY srcs/dashboards /dashboards/

EXPOSE 3000

COPY /srcs/start.sh /start.sh

CMD ./start.sh