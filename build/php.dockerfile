ARG PHP_VER

FROM php:${PHP_VER}-fpm

RUN apt-get update 2>/dev/null

RUN apt-get install -y libzip-dev libfreetype6-dev git libpng-dev libjpeg-dev autoconf g++ make libssl-dev

RUN docker-php-ext-configure gd --with-jpeg && \
	docker-php-ext-install zip gd pdo pdo_mysql exif

RUN pecl install mongodb && docker-php-ext-enable mongodb

RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
	&& curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
	&& php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
	&& php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
	&& rm -f /tmp/composer-setup.*