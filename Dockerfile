FROM composer:1.7

MAINTAINER Pod-Point <software@pod-point.com>

ONBUILD ARG composer_token=test

ONBUILD COPY database/ database/

ONBUILD COPY composer.json composer.json
ONBUILD COPY composer.lock composer.lock

ONBUILD RUN if [ "$composer_token" = "test" ] ; then echo Github token not provided ; else composer config -g github-oauth.github.com $composer_token ; fi

ONBUILD RUN composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --no-dev \
    --prefer-dist
