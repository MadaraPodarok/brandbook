#!/usr/bin/env bash

ROOT_DIR=/var/www/brandbook

cd $ROOT_DIR # Меняем рабочую директорию
whoami

chmod -R 777 ./logs/
chown -R www:www ./

# Установка пакетов Composer
/usr/local/bin/composer install

#Местоположение php-fpm
PHP_FPM=$(which php-fpm)
echo "PHP_FPM Подключен"
#Создаем новый процесс php-fpm
"$PHP_FPM"
# Превентация остановки контейнера
tail -f /dev/null