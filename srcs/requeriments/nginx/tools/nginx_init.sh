#!/bin/bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $CERTKEY_PATH -out $CERT_PATH -subj "/C=Spain/ST=Andalusia/L=Malaga/O=42/OU=42/CN=$DOMAIN/UID=$LOGIN"

sed -i "s#cert_path#$CERT_PATH#g" /etc/nginx/nginx.conf
sed -i "s#certkey_path#$CERTKEY_PATH#g" /etc/nginx/nginx.conf

nginx -g "daemon off;"


openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=Spain/ST=Andalusia/L=Malaga/O=42/OU=42/CN=$DOMAIN/UID=$LOGIN"
