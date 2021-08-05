FROM debian:latest
MAINTAINER atlas <web.dev89@yandex.by>

ENV VIRTUALHOST apache
ENV TZ Europe/Minsk

RUN apt-get update && apt-get -y upgrade \
    && apt-get install -y apache2 php7.3 php-memcached libapache2-mod-php7.3 git curl

#Расширения для работы с базами данных
RUN apt-get install php7.3-mysql php7.3-sqlite3 php7.3-pgsql php7.3-common php7.3-curl

RUN a2enmod php7.3
RUN a2enmod rewrite

EXPOSE 80

WORKDIR "/var/www"

COPY start.sh /usr/local/bin/start.sh
CMD /usr/local/bin/start.sh