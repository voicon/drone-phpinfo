FROM php:7.3.4-apache

RUN apt-get update \
&& apt-get install -y apt-utils vim curl sqlite3 \
&& pecl install xdebug

# copy test db file
# ADD ./db/employee.db /employee.db
COPY ./www /var/www/html

# The base image does not have php.ini. 
# Copy our own, with xdebug settings
ADD ./config/php.ini /usr/local/etc/php/

EXPOSE 80