FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt install -y nginx && apt install -y openssl

COPY ./conf/nginx.conf etc/nginx/nginx.conf

COPY ./tools/init.sh /nginx_init.sh

RUN chmod +x nginx_init.sh

CMD ["./nginx_init.sh"]