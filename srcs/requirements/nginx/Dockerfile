FROM debian:bullseye


# Install Nginx
RUN apt-get update && apt-get install -y nginx \
    openssl \
    curl \
    vim \
    sudo

# Create a directory for the SSL certificate
RUN mkdir /etc/nginx/ssl


# Generate a self-signed certificate
RUN openssl req -x509 -nodes \
    #out means output file for the certificate file the public key 
    -out /etc/nginx/ssl/inception.crt \
    #keyout means output file for the key file the private key
    -keyout /etc/nginx/ssl/inception.key \
    # provides the certificate's subject information
    -subj "/C=MA/ST=kh/L=khouribga/O=Global Security/OU=ma Department/CN=abazerou-.42.fr"

# Copy the Nginx configuration file to the container
COPY conf/nginx.conf /etc/nginx/nginx.conf


# run the Nginx server in the foreground with the -g option set to daemon off to run the server in the foreground
CMD ["nginx", "-g", "daemon off;"]