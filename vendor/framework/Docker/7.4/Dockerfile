FROM ubuntu:20.04

LABEL maintainer="Antwan van Boheemen"

WORKDIR /var/www/public_html

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=UTC

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get install -y nginx software-properties-common gnupg gosu curl ca-certificates zip unzip git supervisor sqlite3 libcap2-bin libpng-dev python2 dnsutils librsvg2-bin fswatch

RUN add-apt-repository ppa:ondrej/php

RUN apt-get update \
    && apt-get install -y php7.4-cli php7.4-dev \
       php7.4-pgsql php7.4-sqlite3 php7.4-gd php7.4-imagick \
       php7.4-curl \
       php7.4-imap php7.4-mysql php7.4-mbstring \
       php7.4-xml php7.4-zip php7.4-bcmath php7.4-soap \
       php7.4-intl php7.4-readline \
       php7.4-ldap \
       php7.4-msgpack php7.4-igbinary php7.4-redis \
       php7.4-memcached php7.4-pcov php7.4-xdebug php7.4-fpm

RUN apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
RUN setcap "cap_net_bind_service=+ep" /usr/bin/php7.4

# Change ownership and permissions
RUN chown -R www-data:www-data /var/www && \
    chmod -R 755 /var/www

# NGINX
RUN rm -f /etc/nginx/sites-enabled/default \
    && ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# NGINX - COPY a custom configuration file
COPY nginx/default.conf /etc/nginx/sites-available/default

# APACHE
RUN apt-get update && apt-get install -y \
    apache2

# APACHE - Activate mods
RUN a2enmod mpm_event authn_file authn_core authz_host authz_groupfile authz_user access_compat auth_basic auth_digest allowmethods reqtimeout filter mime headers setenvif status autoindex asis alias rewrite proxy proxy_fcgi

# APACHE - Delete default configurations
RUN rm -f /etc/apache2/sites-available/000-default.conf && \
    rm -f /etc/apache/sites-enabled/000-default.conf && \
    rm -f /etc/apache2/ports.conf

# APACHE - Copy a custom configuration files
COPY apache/ports.conf /etc/apache2/ports.conf
COPY apache/default.conf /etc/apache2/sites-enabled/000-default.conf

# PHP
RUN rm -f /etc/php/7.4/fpm/php-fpm.conf
COPY php/fpm.conf /etc/php/7.4/fpm/php-fpm.conf

COPY entrypoint /usr/local/bin/entrypoint
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x /usr/local/bin/entrypoint

RUN groupadd --force -g 1000 www-data

EXPOSE 80 8080 9000

ENTRYPOINT ["entrypoint"]
