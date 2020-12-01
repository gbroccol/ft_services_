#!/bin/sh

rc default

RUN mkdir -p /run/nginx
RUN mkdir -p /run/sshd
RUN chmod 744 /run/nginx
RUN chmod 744 /run/sshd

rc-update add sshd
apk add openrc
touch /run/openrc/softlevel
rc-service sshd start
ssh-keygen -A
rc-service sshd stop

/usr/bin/supervisord -c /supervisor.conf