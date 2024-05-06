#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048\
-out /etc/ssl/certs/nginx-selfsigned.crt -keyout /etc/ssl/private/nginx-selfsigned.key\
-subj "/C=Spain/ST=Andalusia/L=Malaga/O=42/OU=42/CN=$DOMAIN/UID=$LOGIN"

nginx -g "daemon off;"