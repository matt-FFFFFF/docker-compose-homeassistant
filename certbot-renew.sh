#!/bin/bash

docker run --rm -it \
    -v "homeassistant_ha-letsencrypt-data:/etc/letsencrypt" \
    -v "homeassistant_ha-letsencrypt-challenge:/data/letsencrypt" \
    certbot/certbot renew --webroot -w /data/letsencrypt --quiet \
    && docker-compose kill --signal=HUP nginx \
    && docker-compose kill --signal=HUP mosquitto