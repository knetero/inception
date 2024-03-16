FROM debian:bullseye

RUN  apt-get update && apt-get install -y \
     mariadb-server\
     mariadb-client

COPY ./50-server.cnf  /etc/mysql/mariadb.conf.d/50-server.cnf


EXPOSE 3306

COPY ./tools/script.sh /

RUN chmod 777 ./script.sh

CMD service mariadb start && sh -c "./script.sh" && mysqld_safe