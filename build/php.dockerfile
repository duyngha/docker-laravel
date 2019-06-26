FROM php:7.2-fpm-alpine

RUN apk add --no-cache libzip-dev && docker-php-ext-configure zip --with-libzip=/usr/include && docker-php-ext-install zip

RUN apk add freetype-dev libjpeg-turbo-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN apk add --no-cache git libpng libpng-dev && docker-php-ext-install gd

RUN docker-php-ext-install pdo pdo_mysql

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
	&& curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
	&& php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
	&& php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
	&& rm -f /tmp/composer-setup.*