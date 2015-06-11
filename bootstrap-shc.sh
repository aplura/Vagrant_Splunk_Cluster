#!/usr/bin/env bash
echo "Starting Search Head Cluster  Node Configuration"
echo "$@" > /tmp/shc_passed_args
/vagrant/bootstrap-nix.sh "$1" "$2" "$3"

## Copy over our SHC App
cp -r /vagrant/configs/shc/APL-shcnode /opt/splunk/etc/apps

HOSTNAME=$(hostname)
IPADDR=$(ifconfig -a | grep 10.10.50. | awk -F' ' '{ print $2}')
## Setup Search Head Clustering Members
echo "Running Search Head Init"
splunk init shcluster-config -auth admin:changeme -mgmt_uri "https://$IPADDR:8089" -replication_port 8191 -conf_deploy_fetch_url https://10.10.50.130:8089 -secret vagrant
splunk restart

## ELECT THE CAPTIAN, AYE!
if [ "$HOSTNAME" == "shc3" ]; then
	echo "Electing SHC3 as Captain"
	splunk bootstrap shcluster-captain -servers_list "10.10.50.140:8089,10.10.50.150:8089,10.10.50.160:8089" -auth admin:changeme
fi
## Setup Distributed search with the Index Cluster
echo "Setting as part of index cluster"
splunk edit cluster-config -mode searchhead -master_uri https://10.10.50.130:8089 -auth admin:changeme -secret vagrant

## Final Configuration Tasks
/vagrant/bootstrap-final.sh
