FROM php:7.4-fpm

RUN apt-get update && apt-get -y install libonig-dev

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
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

RUN mv composer.phar /usr/local/bin/composer
RUN composer config -g repos.packagist composer https://packagist.jp
RUN composer self-update
