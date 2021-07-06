ARG PHP_VER

FROM php:${PHP_VER}-fpm-alpine

RUN apk add libzip-dev freetype-dev libjpeg-turbo-dev git libpng libpng-dev \
  && docker-php-ext-install zip gd pdo pdo_mysql

RUN apk --update --no-cache add autoconf g++ make && \
	pecl install -f xdebug && \
	docker-php-ext-enable xdebug

RUN pecl install mongodb && docker-php-ext-enable mongodb

RUN apk del --purge autoconf g++ make

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
	&& curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
	&& php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
	&& php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
	&& rm -f /tmp/composer-setup.*