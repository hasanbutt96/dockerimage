
FROM php:7.3-apache

#Install git and MySQL extensions for PHP

RUN apt-get update && apt-get install -y git
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN a2enmod rewrite




#ENV  MYSQL_ROOT_PASSWORD=secret \
 #   MYSQL_DATABASE=auth 
#COPY setup.sql /docker-entrypoint-initdb.d

COPY  . /var/www/html/
EXPOSE 80/tcp
EXPOSE 8080/tcp
EXPOSE 3306/tcp
EXPOSE 443/tcp