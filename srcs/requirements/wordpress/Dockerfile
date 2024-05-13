FROM debian:bullseye

# create html standard directory
RUN mkdir -p /var/www/html

# install neccesary dependencies
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install php php-mysql php-fpm
RUN apt-get -y install mariadb-client
RUN apt-get -y install wget tar

# install wordpress in the html directory
RUN wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
RUN tar -xzvf /tmp/wordpress.tar.gz -C /var/www/html

COPY /tools/wp_init.sh .
EXPOSE 9000

CMD ["sh", "wp_init.sh"]
