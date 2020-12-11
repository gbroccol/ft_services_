FROM	alpine:3.12
RUN		apk update && apk upgrade
RUN		apk add openrc

RUN apk add influxdb

COPY influxdb.conf /etc/influxdb.conf

EXPOSE 8086

VOLUME /var/lib/influxdb

ENTRYPOINT influxd -config /etc/influxdb.conf
