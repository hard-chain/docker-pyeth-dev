echo "Running filebeat service"
service filebeat start

echo "Launching bootstrap node"
/usr/local/bin/pyethapp --unlock 1  -m 0 --password /root/.config/pyethapp/password.txt -l accounts:info,eth.chain:info,eth.chainservice:debug,eth.validator:info,eth.block:debug --log-file /root/log/log.txt run
