# Рабочий образ
FROM php:8.1-fpm
WORKDIR /var/www/brandbook

# Устанавливаем зависимости
RUN apt-get update && apt-get install -y --no-install-recommends \
    cron \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    libmagickwand-dev \
    zip \
    jpegoptim optipng pngquant gifsicle \
    unzip \
    git \
    libpq-dev \
    nano \
    libzip-dev \
    sudo \
    mc \
    net-tools \
    curl \
    wget

# Чистим кеш APT
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install exif pcntl sockets soap bcmath zip

# Устанавливаем Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --2 && chmod +x /usr/local/bin/composer
# Добавлям пользователя для приложения
RUN groupadd -g 1000 www && useradd -u 1000 -ms /bin/bash/ --no-user-group -g www www

COPY ./docker/php/entrypoint.sh /var/www

USER root
# Открываем 9000 порт под FPM и запускаем PHP-FPM сервер
EXPOSE 9000
RUN ["chmod", "+x", "/var/www/entrypoint.sh"]
CMD ["bash", "-c", "/var/www/entrypoint.sh"]

