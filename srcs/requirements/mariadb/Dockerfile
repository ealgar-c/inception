FROM debian:bullseye

# install packages
RUN apt-get -y update 
RUN apt-get -y upgrade 
RUN apt-get install -y mariadb-server
RUN mkdir -p /run/mysqld/

# expose the port so Docker listen from it
EXPOSE 3306

COPY ./tools/mariadb_init.sh ./mariadb_init.sh
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x mariadb_init.sh
CMD ["sh","mariadb_init.sh"]