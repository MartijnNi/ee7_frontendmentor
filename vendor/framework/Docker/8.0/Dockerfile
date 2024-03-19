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
    && apt-get install -y php8.0-cli php8.0-dev \
       php8.0-pgsql php8.0-sqlite3 php8.0-gd php8.0-imagick \
       php8.0-curl \
       php8.0-imap php8.0-mysql php8.0-mbstring \
       php8.0-xml php8.0-zip php8.0-bcmath php8.0-soap \
       php8.0-intl php8.0-readline \
       php8.0-ldap \
       php8.0-msgpack php8.0-igbinary php8.0-redis \
       php8.0-memcached php8.0-pcov php8.0-xdebug php8.0-fpm

RUN apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
RUN setcap "cap_net_bind_service=+ep" /usr/bin/php8.0

# Change ownership and permissions
RUN chown -R www-data:www-data /var/www && \
    chmod -R 755 /var/www

# NGINX
RUN rm -f /etc/nginx/sites-enabled/default \
    && ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# NGINX - COPY a custom configuration file
COPY nginx/default.conf /etc/nginx/sites-available/default
COPY nginx/http.conf /etc/nginx/conf.d/http.conf

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
RUN rm -f /etc/php/8.0/fpm/php-fpm.conf
COPY php/fpm.conf /etc/php/8.0/fpm/php-fpm.conf

COPY entrypoint /usr/local/bin/entrypoint
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x /usr/local/bin/entrypoint

RUN groupadd --force -g 1000 www-data

EXPOSE 80 8080 9000

ENTRYPOINT ["entrypoint"]
