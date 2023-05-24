FROM php:7.4-fpm
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install pdo_mysql zip
RUN apt-get install mc
FROM nginx:latest
FROM mysql:latest

