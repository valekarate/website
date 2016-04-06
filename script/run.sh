#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

/etc/init.d/nginx start

while true; do
  middleman build
  rm -rf /var/www/html
  cp -r /app/build /var/www/html
  sleep 5
done
