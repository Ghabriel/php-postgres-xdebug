###########################################
# CONTAINER: PHP + POSTGRES + XDEBUG
###########################################
FROM php:8.2-apache

# Install PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && docker-php-ext-install pdo_pgsql pgsql

# Install Xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

EXPOSE 80 443
