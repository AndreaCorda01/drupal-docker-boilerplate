#!/bin/bash

echo "SCRIPT: Installing composer libraries"
composer install --no-interaction

echo SCRIPT: Libraries installed


echo "START PHP-FPM"
php-fpm -tt
php-fpm
