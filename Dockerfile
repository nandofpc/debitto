FROM php:8.1.6-fpm-alpine

WORKDIR /var/www/html

RUN apk update && apk add \
    build-base \
    git \
    curl \
    zip \
    libzip-dev \
    libpq-dev \
    postgresql \
    postgresql-client \
    unzip \
    nano

RUN docker-php-ext-configure pgsql 
RUN docker-php-ext-install pdo pdo_pgsql pgsql zip exif pcntl mysqli

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

USER root

RUN chmod 777 -R /var/www/html