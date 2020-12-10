# telegraf - агент по сбору данных

FROM	alpine:3.12
RUN		apk update && apk upgrade
RUN		apk add openrc

RUN	apk add --no-cache telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

COPY ./telegraf.conf /etc/telegraf.conf

VOLUME /var/run/docker.sock

ENTRYPOINT telegraf --config /etc/telegraf.conf