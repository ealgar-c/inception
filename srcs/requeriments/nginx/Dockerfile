FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt install -y nginx && apt install -y openssl

COPY ./conf/nginx.conf etc/nginx/nginx.conf

COPY ./tools/nginx_init.sh ./init.sh

RUN chmod +x init.sh

CMD ["./init.sh"]

ENTRYPOINT ["tail", "-f", "sh"]