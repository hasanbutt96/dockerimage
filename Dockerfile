
FROM php:7.3-apache

#Install git and MySQL extensions for PHP

RUN apt-get update && apt-get install -y git
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN a2enmod rewrite

ENV  MYSQL_DATABASE=auth \
    MYSQL_ROOT_PASSWORD=secret 

#FROM mysql:5.6
USER root
COPY setup.sh /mysql/setup.sh
COPY setup.sql /mysql/setup.sql
RUN chmod +x /mysql/setup.sh
SHELL [ "setup" ] 
COPY  . /var/www/html/
EXPOSE 80/tcp
EXPOSE 3306/tcp
EXPOSE 443/tcp