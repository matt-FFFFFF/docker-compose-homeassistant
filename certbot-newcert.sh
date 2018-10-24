#!/bin/bash

docker run --rm -it \
    -v "homeassistant_ha-letsencrypt-data:/etc/letsencrypt" \
    -v "homeassistant_ha-letsencrypt-challenge:/data/letsencrypt" \
    certbot/certbot certonly --webroot --webroot-path=/data/letsencrypt \
    --email matt.ffffff@gmail.com --no-eff-email \
    --agree-tos -d ha.hardac.co.uk