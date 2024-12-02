FROM php:8.2-apache


RUN apt-get update && apt-get install cron -y

RUN docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install mysqli && docker-php-ext-enable mysqli pdo_mysql

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN a2enmod rewrite

WORKDIR /var/www/html

COPY ./src /var/www/html/

EXPOSE 80