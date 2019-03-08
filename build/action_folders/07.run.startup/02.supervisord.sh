#!/bin/bash

if [ -e /etc/supervisord.conf ]; then
    : ${SUPERVISORD_USER:?"Environment variable 'SUPERVISORD_USER' not defined in '${BASH_SOURCE[0]}'"}
    : ${SUPERVISORD_PASS:?"Environment variable 'SUPERVISORD_PASS' not defined in '${BASH_SOURCE[0]}'"}

    term.log "    updating '/etc/supervisord.conf' with 'chown=${WWW_USER}:${WWW_GROUP}'\n" 'white' 
    sed -i \
        -e "s|^username=.*$|username=${SUPERVISORD_USER}|" \
        -e "s|^password=.*$|password=${SUPERVISORD_PASS}|" \
        -e "s|chown=.*$|chown=${WWW_USER}:${WWW_GROUP}|g" \
           "/etc/supervisord.conf"
    term.log "    supervisord available on http://${CONTAINER_NAME}:9001\n"

fi

crf.fixupDirectory "$WWW" "$WWW_UID"