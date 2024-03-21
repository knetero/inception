#!/bin/sh

# Define the WordPress path
WP_PATH="/var/www/html"

# Update PHP configurations , listen on TCP port 9000 instead of the default Unix socket. 
# This change allows NGINX to communicate with PHP-FPM over a network port.
sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf


# Check if the WordPress configuration file exists
if [ ! -f "$WP_PATH/wp-config.php" ]; then
    # Download wp-cli
    echo "Downloading wp-cli..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    # Download WordPress core
    echo "Downloading WordPress core..."
    wp core download --path="$WP_PATH" --allow-root

    # Create wp-config.php file
    echo "Creating wp-config..."
    echo "Using DB_NAME: $MARIADB_DB"
    echo "Using DB_USER: $MARIADB_USER"
    echo "Using DB_PASSWORD: $MARIADB_PASS"
    echo "Using DB_HOST: $DB_HOST"
    wp config create --dbname="$MARIADB_DB" \
                     --dbuser="$MARIADB_USER" \
                     --dbpass="$MARIADB_PASS" \
                     --dbhost="$DB_HOST" \
                     --path="$WP_PATH" \
                     --allow-root

    # Install WordPress
    echo "Installing WordPress..."
    wp core install --url="$WP_URL" \
                    --title="$WP_TITLE" \
                    --admin_user="$WP_USER_LOGIN" \
                    --admin_password="$WP_USER_PASSWORD" \
                    --admin_email="$WP_USER_EMAIL" \
                    --path="$WP_PATH" \
                    --allow-root

    # Create a new user
    wp user create --allow-root ${WP_USER} ${WP_EMAIL} --user_pass=${USER_PASS}

    echo "${GREEN}WORDPRESS INSTALLATION FINISHED.${NC}"
else
    echo "${GREEN}WORDPRESS IS ALREADY INSTALLED.${NC}"
fi

# Start PHP FPM
/usr/sbin/php-fpm7.4 -F