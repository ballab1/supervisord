#!/bin/bash

if [ -e /etc/supervisord.conf ]; then
    sed -i \
        -e "s|^username=.*$|username=${SUPERVISORD_USER}|" \
        -e "s|^password=.*$|password=${SUPERVISORD_PASS}|" \
        -e "s|supervisord:9001|${HOSTNAME}:9001|g" \
           "/etc/supervisord.conf"
    echo "supervisord available on http://${CONTAINER_NAME}:9001"
fi
