#!/usr/bin/env bash
#!/usr/bin/env bash
echo "Starting Indexer Configuration"
echo "$@" > /tmp/idx_passed_args
/vagrant/bootstrap-nix.sh "$1" "$2" "$3"

## Copy over our Master App
cp -r /vagrant/configs/idx/APL-idxcluster /opt/splunk/etc/apps

## Final Configuration Tasks
/vagrant/bootstrap-final.sh


