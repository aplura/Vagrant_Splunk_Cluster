#!/usr/bin/env bash
echo "Starting Nix Configurations"
echo "$@" > /tmp/nix_passed_args
FN="splunk-*$1*-*$2*.$3"
echo "$FN"
EX="rpm"
if [ "$3" == "deb" ]; then
EX="dpkg"
fi
sudo yum install vim-enhanced rsync -y
sudo cat /vagrant/configs/hosts >> /etc/hosts
FILE=$(find /vagrant/ -name "$FN")
echo "$FILE" > /tmp/splunk_provisioned_version
sudo $EX -i $FILE
mkdir /root/.splunk
chown -R splunk:  /root/.splunk
chown -R splunk: /opt/splunk
sudo runuser -l splunk -c '/opt/splunk/bin/splunk start --accept-license'
sudo /opt/splunk/bin/splunk enable boot-start -user splunk
ln -s /opt/splunk/bin/splunk /usr/bin/splunk
