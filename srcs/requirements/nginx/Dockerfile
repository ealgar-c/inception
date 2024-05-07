FROM debian:bullseye

# install packages
RUN apt-get -y update 
RUN apt-get -y upgrade 
RUN apt-get install -y nginx openssl

# copy necessary files
COPY ./conf/nginx.conf etc/nginx/nginx.conf
COPY ./tools/nginx_init.sh ./nginx_init.sh

# expose the port so Docker listen from it
EXPOSE 443

# execute necessary commands
RUN chmod +x nginx_init.sh
CMD ["./nginx_init.sh"]