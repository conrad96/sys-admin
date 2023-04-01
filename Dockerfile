FROM php:8.2.4

RUN apt-get update -y && apt-get install -y openssl zip unzip git php-cli
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer require docker-php/docker-php-ext-install
RUN docker-php-ext-install pdo pdo_mysql mbstring

WORKDIR /
COPY . . 
RUN composer install 

CMD php artisan serve --host=0.0.0.0
EXPOSE 8000 