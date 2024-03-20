FROM	debian:bullseye

RUN		apt update -y && \
		apt install -y php7.4-fpm \
		mariadb-client \
		php-mysql \
		sendmail \
		curl

COPY	./tools/script.sh /tmp

RUN 	chmod +x /tmp/script.sh

RUN		mkdir -p /var/www/html

# wordir is the directory where the command will be executed
WORKDIR /var/www/html

RUN		mkdir -p /run/php

EXPOSE	9000

# ENTRYPOINT is the command that will be executed when the container starts
ENTRYPOINT [ "sh", "/tmp/script.sh" ]
