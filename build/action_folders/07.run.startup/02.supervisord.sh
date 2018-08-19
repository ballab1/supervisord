#!/bin/bash

if [ -e /etc/supervisord.conf ]; then
    : ${SUPERVISORD_USER:?"Environment variable 'SUPERVISORD_USER' not defined in '${BASH_SOURCE[0]}'"}
    : ${SUPERVISORD_PASS:?"Environment variable 'SUPERVISORD_PASS' not defined in '${BASH_SOURCE[0]}'"}

    declare -r cnf_file=/etc/supervisord.conf
    term.log "    updating username,password,chown and serverurl in '${cnf_file}'\n" 'white' 
    sed -Ei \
        -e "s|^username=.*$|username=${SUPERVISORD_USER}|" \
        -e "s|^password=.*$|password=${SUPERVISORD_PASS}|" \
        -e "s|chown=.*$|chown=${WWW_USER}:${WWW_GROUP}|g" \
        -e "s|serverurl=http://.+:9001.*$|serverurl=http://${HOSTNAME}:9001|g" \
           "$cnf_file"
    term.log "    supervisord available on http://${HOSTNAME}:9001\n"

fi

crf.fixupDirectory "$WWW" "$WWW_UID"