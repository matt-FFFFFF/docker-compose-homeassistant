#!/bin/ash

# Delete old user database
if [ -f /mosquitto/config/passwd ]; then
	rm -f /mosquitto/config/passwd
fi

# Generate logins
touch /mosquitto/config/passwd
awk -F":" '{print "mosquitto_passwd -b /mosquitto/config/passwd " $1 " " $2 }' /mosquitto/config/logins | sh

# Start original entrypoint
set -e
/usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf
