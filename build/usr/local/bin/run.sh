#!/bin/sh
shift
exec supervisord --nodaemon --configuration="/etc/supervisord.conf" --loglevel=info
