#!/usr/bin/env bash
echo "Starting Master Node Configuration"
echo "$@" > /tmp/mn_passed_args
/vagrant/bootstrap-nix.sh "$1" "$2" "$3"

## Copy over our Master App
cp -r /vagrant/configs/master/APL-masternode /opt/splunk/etc/apps

## Final Configuration Tasks
/vagrant/bootstrap-final.sh

### HAPROXY CONFIG
echo "Starting Haproxy Configuration"
if [ ! -f /etc/haproxy/haproxy.cfg ]; then

  # Install haproxy
  sudo yum install haproxy -y

  # Configure haproxy
  cat > /etc/default/haproxy <<EOD
# Set ENABLED to 1 if you want the init script to start haproxy.
ENABLED=1
# Add extra flags here.
#EXTRAOPTS="-de -m 16"
EOD
  cat > /etc/haproxy/haproxy.cfg <<EOD
global
    daemon
    maxconn 256
    log 127.0.0.1 local2
defaults
    mode http
    timeout connect 5000ms
    timeout client 50000ms
    timeout server 50000ms
frontend http-in
    bind *:80
    default_backend webservers
backend webservers
    balance roundrobin
    # Poor-man's sticky
    # balance source
    # JSP SessionID Sticky
    # appsession JSESSIONID len 52 timeout 3h
    option httpchk
    option forwardfor
    option http-server-close
    server shc1 10.10.50.140:8000 maxconn 32 check ssl verify none
    server shc2 10.10.50.150:8000 maxconn 32 check ssl verify none
    server shc3 10.10.50.160:8000 maxconn 32 check ssl verify none

listen admin
    bind *:8080
    stats enable
EOD

  cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.orig
  /bin/systemctl restart haproxy.service
fi

### Logging
if [ ! -f /etc/rsyslog.d/haproxy.conf ]; then
	cat > /etc/rsyslog.d/haproxy.conf <<EOD
local2.*    /var/log/haproxy.log
EOD

	cat >> /etc/rsyslog.conf <<EOD
$ModLoad imudp
$UDPServerRun 514
$UDPServerAddress 127.0.0.1

EOD

service rsyslog restart
service haproxy restart
fi
