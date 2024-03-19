FROM ubuntu:22.04

LABEL maintainer="Antwan van Boheemen"

WORKDIR /var/www/public_html

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=UTC

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get install -y nginx software-properties-common gnupg gosu curl ca-certificates zip unzip git supervisor sqlite3 libcap2-bin libpng-dev python2 dnsutils librsvg2-bin fswatch

RUN add-apt-repository ppa:ondrej/php

RUN apt-get update \
    && apt-get install -y php8.1-cli php8.1-dev \
       php8.1-pgsql php8.1-sqlite3 php8.1-gd php8.1-imagick \
       php8.1-curl \
       php8.1-imap php8.1-mysql php8.1-mbstring \
       php8.1-xml php8.1-zip php8.1-bcmath php8.1-soap \
       php8.1-intl php8.1-readline \
       php8.1-ldap \
       php8.1-msgpack php8.1-igbinary php8.1-redis \
       php8.1-memcached php8.1-pcov php8.1-xdebug php8.1-fpm

RUN apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
RUN setcap "cap_net_bind_service=+ep" /usr/bin/php8.1

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
RUN rm -f /etc/php/8.1/fpm/php-fpm.conf
COPY php/fpm.conf /etc/php/8.1/fpm/php-fpm.conf

COPY entrypoint /usr/local/bin/entrypoint
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x /usr/local/bin/entrypoint

RUN groupadd --force -g 1000 www-data

EXPOSE 80 8080 9000

ENTRYPOINT ["entrypoint"]
