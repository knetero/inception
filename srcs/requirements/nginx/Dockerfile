FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx \
    openssl \
    curl \
    vim \
    sudo

RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=MA/ST=kh/L=khouribga/O=Global Security/OU=ma Department/CN=abazerou-.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]