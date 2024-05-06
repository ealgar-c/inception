FROM debian:bullseye

RUN apt-get -y update 
RUN apt-get -y upgrade 
RUN apt-get install -y nginx 
RUN apt-get install -y openssl

COPY ./conf/nginx.conf etc/nginx/nginx.conf

COPY ./tools/nginx_init.sh ./init.sh

RUN chmod +x init.sh

RUN ./init.sh