#!/bin/bash

chown -R www-data:www-data /config

/wait-for-it.sh -h mariadb -p 3306 -- \
	/gosu www-data:www-data \
	python -m homeassistant --config /config
