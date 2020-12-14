FROM	alpine:3.12
RUN		apk update && apk upgrade
RUN		apk add openrc

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_i386.tar.gz
RUN tar xf telegraf-1.16.2_linux_i386.tar.gz

COPY ./telegraf.conf /telegraf-1.16.2/etc/telegraf/telegraf.conf
# VOLUME /var/run/docker.sock

ENTRYPOINT /telegraf-1.16.2/usr/bin/telegraf --config /telegraf-1.16.2/etc/telegraf/telegraf.conf
