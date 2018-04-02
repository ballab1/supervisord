#!/bin/bash

mkdir -p /var/run/php
chmod 777 /var/run/php

touch /var/run/php/fcgiwrap.sock
find /var/run/php -type f -exec chmod 666 '{}' \;
