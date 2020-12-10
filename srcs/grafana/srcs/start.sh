cd /usr/share/grafana
grafana-cli admin reset-admin-password password
/usr/sbin/grafana-server web --config /etc/grafana.ini