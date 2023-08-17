FROM php:8.0-apache
RUN apt-get update && apt-get upgrade -y && apt-get install -y
#extension refer: https://github.com/mlocati/docker-php-extension-installer
RUN docker-php-ext-install mysqli
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

#RUN mkdir -p /etc/apache2/ssl
#COPY ./cert.pem /etc/apache2/ssl
#COPY ./private.pem /etc/apache2/ssl
#COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
#COPY ./timezone /etc/timezone
#RUN apk add --update --no-cache libgd libpng-dev libjpeg-turbo-dev freetype-dev -y
#RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
#RUN a2enmod ssl 
#RUN a2enmod rewrite
#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

#RUN service apache2 restart
#RUN chmod 775 -R /var/www/html
EXPOSE 80
EXPOSE 443

