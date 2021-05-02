FROM debian:latest
MAINTAINER atlas <web.dev89@yandex.by>

RUN apt-get update && apt-get -y upgrade \
    && apt-get install -y apache2 php7.3 php-memcached libapache2-mod-php7.3 git curl

RUN a2enmod php7.3
RUN a2enmod rewrite

EXPOSE 80

WORKDIR "/var/www"

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]