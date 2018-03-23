#!/bin/bash

if [ -e /etc/supervisord.conf ]; then
    sed -i \
        -e "s|^username=.*$|username=${SUPERVISORD_USER}|" \
        -e "s|^password=.*$|password=${SUPERVISORD_PASS}|" \
           "/etc/supervisord.conf"
fi
