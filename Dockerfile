FROM php:8.0-rc-cli-buster as builder
ENV VERSION 1.13.2 DEBIAN_FRONTEND="noninteractive"

WORKDIR /var/www/html
RUN apt-get update -y && apt-get install libgmp-dev apt-utils git -y
RUN docker-php-ext-install gmp bcmath
RUN git clone https://github.com/phpcoinn/node /var/www/html
RUN mkdir dist && php --define phar.readonly=0 build/make_miner.php

FROM php:8.0-rc-cli-buster
ENV VERSION 1.13.2 DEBIAN_FRONTEND="noninteractive"
WORKDIR /root
# Install the gmp and mcrypt extensions
RUN apt-get update && apt-get install -y --no-install-recommends libgmp-dev procps \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install gmp bcmath
COPY --from=builder /var/www/html/dist /usr/local/bin
ENV MINER_SERVER_ADDRESS WALLET_ADDRESS CPU_USAGE
ENTRYPOINT [ "bash", "-c", "phpcoin-miner ${MINER_SERVER_ADDRESS} ${WALLET_ADDRESS} ${CPU_USAGE}" ]
