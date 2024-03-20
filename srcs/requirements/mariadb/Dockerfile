FROM debian:bullseye

# Install MariaDB
RUN  apt-get update && apt-get install -y \
     mariadb-server\
     mariadb-client

# Copy the MariaDB configuration file to the container
COPY ./50-server.cnf  /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

#copy the script to the container
COPY ./tools/script.sh /

RUN chmod 777 ./script.sh


# Start the MariaDB service and run the script
CMD service mariadb start && sh -c "./script.sh" && mysqld_safe