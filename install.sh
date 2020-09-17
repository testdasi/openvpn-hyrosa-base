#!/bin/bash

### openvpn, nftables, stubby, tinyproxy, dante, sabnzbdplus, nzbhydra2 are in the base image ###

apt-get -y update

# clean up
#apt-get -y autoremove \
#    && apt-get -y autoclean \
#    && apt-get -y clean \
#    && rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*
