#!/usr/bin/env bash
echo "Starting Final Configurations"
echo "$@" > /tmp/final_passed_args
/opt/splunk/bin/splunk edit user admin -password 'superS3cr3t' -roles admin -auth admin:changeme
sudo touch /opt/splunk/etc/.ui_login
sudo chown -R splunk: /opt/splunk
sudo -u splunk splunk restart
