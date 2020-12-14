FROM	alpine:3.12
RUN		apk update && apk upgrade
RUN		apk add openrc

RUN		apk add --no-cache grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

COPY	start.sh /start.sh
RUN		chmod +x start.sh

COPY	grafana.ini /etc/grafana.ini

COPY	srcs/provisioning /usr/share/grafana/conf/provisioning

RUN		mkdir dashboards
COPY	srcs/dashboards /dashboards/

EXPOSE	3000

CMD		./start.sh