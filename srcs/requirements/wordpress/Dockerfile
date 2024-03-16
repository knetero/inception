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

WORKDIR /var/www/html

RUN		mkdir -p /run/php

EXPOSE	9000

ENTRYPOINT [ "sh", "/tmp/script.sh" ]
