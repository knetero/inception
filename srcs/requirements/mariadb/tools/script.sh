#!/bin/bash
sleep 3

# Replace 'your_root_password' with your actual root password
mariadb -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mariadb -e "CREATE USER IF NOT EXISTS 'abazerou'@'localhost' IDENTIFIED BY '1234';"
mariadb -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'abazerou'@'%' IDENTIFIED BY '1234';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';"
mariadb -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p1234 shutdown
