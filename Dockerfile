FROM php:7.4-fpm
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install pdo_mysql zip
COPY php-fpm/www.conf /usr/local/etc/php-fpm.d/www.conf
FROM nginx:latest
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY www /var/www/html
FROM mysql:latest
COPY mysql/init.sql /docker-entrypoint-initdb.d/init.sql

