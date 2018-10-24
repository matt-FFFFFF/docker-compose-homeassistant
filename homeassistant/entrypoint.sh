#!/bin/bash

/wait-for-it.sh -h ha-mariadb -p 3306 -- \
	chown -R www-data:www-data /config && \
	/gosu www-data:www-data \
	python -m homeassistant --config /config
