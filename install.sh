#!/bin/bash

### openvpn, nftables, stubby, tinyproxy, dante, sabnzbdplus, nzbhydra2, curl, launcher are in the base image ###

# install rtorrent with screen (required to send it to background)
apt-get -y update \
    && apt-get -y install rtorrent screen
    
# install additional packages to build flood
apt-get -y install build-essential git
# install nodejs to run flood
curl -sL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get -y install -y nodejs
# build flood
cd /app \
    && git clone https://github.com/jfurrow/flood.git \
    && cd flood \
    && cp config.template.js config.js \
    && npm install \
    && npm install -g node-gyp \
    && npm run build

# clean up
apt-get -y remove build-essential git \
    && apt-get -y autoremove \
    && apt-get -y install procps \
    && apt-get -y autoclean \
    && apt-get -y clean \
    && rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*
