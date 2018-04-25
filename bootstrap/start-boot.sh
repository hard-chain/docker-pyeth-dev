echo "Running filebeat service"
service filebeat start

echo "Launching bootstrap node"
/usr/local/bin/pyethapp  -m 0 --password /root/.config/pyethapp/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file /root/log/log.txt run
