FROM ubuntu:16.04
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

COPY sources.list /etc/apt/

# Install system dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common vim git iputils-ping
RUN add-apt-repository -y ppa:jonathonf/python-3.6
RUN add-apt-repository -y ppa:ethereum/ethereum
RUN apt-get update 
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y solc build-essential python-minimal aptitude curl \
    libssl-dev automake pkg-config libtool libffi-dev libgmp-dev
RUN apt-get install -y python3.6 python3.6-dev python3-pip python3.6-venv

# Install Python dependencies
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel
RUN ln -sf /usr/local/bin/pip3.6 /usr/local/bin/pip \
    && ln -sf /usr/bin/python3.6 /usr/local/bin/python \
    && pip install -U pip
RUN pip install coincurve==6.0.0 web3

# Clone and install (editable) required repositories
WORKDIR /ethereum
RUN git clone https://github.com/ethereum/viper.git
RUN git clone https://github.com/linyize/tinyrpc.git
RUN git clone https://github.com/linyize/pyethereum.git --branch feature-pos &&\
    cd pyethereum && git submodule update --init casper
RUN git clone https://github.com/linyize/pyethapp.git --branch feature-pos
RUN cd viper && git reset --hard 9be3ac1945ab98c932ec769274965e9bb0536bb2 && python setup.py develop
RUN cd pyethapp && python setup.py develop
RUN cd pyethereum/casper && git checkout feature-pos
RUN cd pyethereum && python setup.py develop
RUN cd tinyrpc && python setup.py develop

# Download the filebeat package and install 
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.1.0-amd64.deb
RUN dpkg -i filebeat-6.1.0-amd64.deb
