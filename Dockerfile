
FROM php:8.3-fpm AS drupal-base

WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    libzip-dev \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libpq-dev \
    libonig-dev \
    libxml2-dev \
    libmcrypt-dev \
    sendmail \
    sendmail-bin \
    && docker-php-ext-install pdo_mysql zip exif pcntl bcmath gd opcache \
    && docker-php-ext-enable opcache \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Enable sendmail


# Install composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


COPY composer.json .

# Install Drush globally
RUN composer require drush/drush
ENV PATH="${PATH}:/var/www/html/vendor/bin"