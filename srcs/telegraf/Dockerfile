FROM	alpine:3.12
RUN		apk update && apk upgrade
RUN		apk add openrc

# RUN	apk add --no-cache telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_i386.tar.gz && tar xf telegraf-1.16.2_linux_i386.tar.gz

COPY ./telegraf.conf /telegraf-1.16.2/etc/telegraf/telegraf.conf
VOLUME /var/run/docker.sock

ENTRYPOINT /telegraf-1.16.2/usr/bin/telegraf --config /telegraf-1.16.2/etc/telegraf/telegraf.conf


# COPY ./telegraf.conf /etc/telegraf.conf
# VOLUME /var/run/docker.sock

# ENTRYPOINT telegraf --config /etc/telegraf.conf

# mkdir /downloads
# cd /downloads
# wget https://dl.influxdata.com/telegraf/releases/telegraf_1.12.1-1_amd64.deb
# dpkg -i telegraf_1.12.1-1_amd64.deb