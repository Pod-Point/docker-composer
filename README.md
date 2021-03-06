Composer
=====================
[![https://hub.docker.com/r/podpoint/composer/](https://img.shields.io/docker/build/podpoint/composer.svg)](https://hub.docker.com/r/podpoint/composer)
[![Docker Pulls](https://img.shields.io/docker/pulls/podpoint/composer.svg?maxAge=2592000)](https://hub.docker.com/r/podpoint/composer)
[![](https://img.shields.io/microbadger/image-size/podpoint/composer.svg?style=flat)](https://microbadger.com/images/podpoint/composer)

This image provides Composer and installs vendor dependencies for Pod Point Laravel applications.
It is based on the [Official Composer](https://hub.docker.com/_/composer) image.

# Supported tags and respective `Dockerfile` links

We provide the following version tags:

* [`latest` (*Dockerfile*)](https://github.com/Pod-Point/docker-composer/blob/master/Dockerfile)

# Usage

Use as part of a multi-stage build to install Composer dependencies:

```Dockerfile
FROM podpoint/composer:latest as vendor
```

You can then copy your vendor assets into your final image:

```Dockerfile
COPY --from=vendor /app/vendor/ /srv/www/vendor/
```

You can optionally supply a `composer_token` argument to authenticate against github with a token:

```bash
$ docker build --build-arg composer_token=TOKEN -t podpoint/my-image .
```
