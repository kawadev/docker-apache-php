FROM php:7.2-fpm

RUN apt-get update \
    && apt-get -y install git wget zip sshpass\
       libmcrypt-dev libxml2-dev \
    && docker-php-ext-install -j$(nproc) bcmath iconv pdo_mysql mbstring xml tokenizer

# ImageMagick Install
RUN apt-get update && apt-get install -y \
    libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
	&& docker-php-ext-enable imagick

RUN apt-get update && apt-get -y install rsync

# Composer install.
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'baf1608c33254d00611ac1705c1d9958c817a1a33bce370c0595974b342601bd80b92a3f46067da89e3b06bff421f182') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

RUN mv composer.phar /usr/local/bin/composer
RUN composer config -g repos.packagist composer https://packagist.jp
RUN composer self-update
