FROM php:7.4-apache

ENV APACHE_DOCUMENT_ROOT /var/www/html

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    apt-transport-https \
    apt-utils \
    build-essential \
    curl \
    debconf-utils \
    gcc \
    npm \
    vim \
    git \
    gnupg2 \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libpq-dev \
    libzip-dev \
    locales \
    ssl-cert \
    unzip \
    zlib1g-dev \
    libwebp-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && echo "en_US.UTF-8 UTF-8" >/etc/locale.gen \
  && locale-gen \
  ;

RUN pecl install xdebug \
  && docker-php-ext-enable xdebug

RUN docker-php-ext-install -j$(nproc) zip gd mysqli pdo_mysql opcache intl pgsql pdo_pgsql;

RUN a2enmod rewrite authz_groupfile headers ssl
# Enable SSL
RUN ln -s /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-enabled/default-ssl.conf
EXPOSE 443

COPY --from=composer:1.8.6 /usr/bin/composer /usr/bin/composer

COPY ./dockerbuild/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

