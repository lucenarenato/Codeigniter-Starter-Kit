FROM php:8.1-fpm
# FROM php:fpm

# Set defaults for variables used by run.sh
ENV COMPOSER_HOME=/root/.composer
ENV COMPOSER_VERSION 1.6.2
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

# Get packages that we need in container
RUN apt-get update -q -y \
    && apt-get install -q -y --no-install-recommends \
        ca-certificates \
        curl \
        acl \
        sudo \
# Disable expired Let's Encrypt certificate
    && sed -i '/mozilla\/DST_Root_CA_X3.crt/ s/./!&/' /etc/ca-certificates.conf \
    && update-ca-certificates --verbose \
# Needed for the php extensions we enable below
    && apt-get install -q -y --no-install-recommends \
        libfreetype6 \
        libjpeg62-turbo \
        libxpm4 \
        libpng16-16 \
        libmemcachedutil2 \
        libpq5 \ 
# git & unzip needed for composer, unless we document to use dev image for composer install
# unzip needed due to https://github.com/composer/composer/issues/4471
        unzip \
        git \
# packages useful for dev
        less \
        vim \
        wget \
        tree \
    && rm -rf /var/lib/apt/lists/*

# Create Composer directory (cache and auth files) & Get Composer
RUN mkdir -p $COMPOSER_HOME \
    # && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Install composer
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=$COMPOSER_VERSION &&\
		chmod +x /usr/local/bin/composer
RUN composer --version
