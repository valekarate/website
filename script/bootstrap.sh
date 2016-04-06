#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# PACKAGES
apt-get  -q update

# NODE
apt-get -yq install nodejs npm
ln -s /usr/bin/nodejs /usr/bin/node

# NGINX
apt-get -yq install nginx
/etc/init.d/nginx start

# CLEAN UP
rm -rf /var/cache/apt/archives/*.deb \
rm -rf /root/* \
rm -rf /tmp/*
