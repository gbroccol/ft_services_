#!/bin/sh

# apk add openrc
# mkdir -p /run/openrc
# touch /run/openrc/softlevel

openrc default
/etc/init.d/mariadb setup           # lib/rc/sh/openrc-run.sh: line 100: can't create /sys/fs/cgroup/blkio/tasks: Read-only file system
rc-service mariadb start            # /lib/rc/sh/openrc-run.sh: line 100: can't create /sys/fs/cgroup/blkio/tasks: Read-only file system
mysql -u root mysql < mysql_create.sql
mysql -u root gbroccol < gbroccol.sql 
rc-service mariadb stop             # /lib/rc/sh/openrc-run.sh: line 100: can't create /sys/fs/cgroup/blkio/tasks: Read-only file system
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'

# sleep infinity