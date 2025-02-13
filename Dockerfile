FROM php:7.4-cli

WORKDIR /opt

RUN apt-get -y update && apt-get install -y git zlib1g-dev libzip-dev unzip libicu-dev

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }" && \
php composer-setup.php && \
php -r "unlink('composer-setup.php');" && \
mv composer.phar /usr/local/bin/composer

RUN docker-php-ext-install zip intl