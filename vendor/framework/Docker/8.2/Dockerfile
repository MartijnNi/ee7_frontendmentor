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
    && apt-get install -y php8.2-cli php8.2-dev \
       php8.2-pgsql php8.2-sqlite3 php8.2-gd php8.2-imagick \
       php8.2-curl \
       php8.2-imap php8.2-mysql php8.2-mbstring \
       php8.2-xml php8.2-zip php8.2-bcmath php8.2-soap \
       php8.2-intl php8.2-readline \
       php8.2-ldap \
       php8.2-msgpack php8.2-igbinary php8.2-redis \
       php8.2-memcached php8.2-pcov php8.2-xdebug php8.2-fpm

RUN apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
RUN setcap "cap_net_bind_service=+ep" /usr/bin/php8.2

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
RUN rm -f /etc/php/8.2/fpm/php-fpm.conf
COPY php/fpm.conf /etc/php/8.2/fpm/php-fpm.conf

COPY entrypoint /usr/local/bin/entrypoint
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x /usr/local/bin/entrypoint

RUN groupadd --force -g 1000 www-data

EXPOSE 80 8080 9000

ENTRYPOINT ["entrypoint"]
