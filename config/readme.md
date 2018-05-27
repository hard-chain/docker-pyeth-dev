这个目录存放的是以太坊的配置文件，放在宿主机上，通过volume挂载的方式导入到container里面
    ports:
     - "10.19.131.103:30303:30303/tcp"
     - "10.19.131.103:30303:30303/udp"
    volumes:
     - /root/docker-pyeth-dev/miner/start-validator.sh:/root/start.sh
     - /root/pyethereum:/ethereum/pyethereum
     - /root/pyethapp:/ethereum/pyethapp
     - /root/pydevp2p:/ethereum/pydevp2p
     - /opt/pyethapp:/root/.config/pyethapp
