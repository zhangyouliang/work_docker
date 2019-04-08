FROM ubuntu:16.04
MAINTAINER dsk <393573645@qq.com>

COPY install.sh /usr/local/bin/install.sh

ENV TZ="Asia/Shanghai"

RUN apt-get update && \
    apt-get install -y  apt-utils language-pack-en-base software-properties-common && \
    locale-gen en_US.UTF-8 && \
    LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt-get update

RUN apt-get install -y  \
    git \ 
    vim \ 
    nginx  \
    python \
    python-pip \
    python-dev \
    build-essential \
    php7.1 \
    php7.1-dev \
    php7.1-redis \
    php7.1-mcrypt  \
    php7.1-fpm \
    php7.1-mysql \
    php7.1-curl \
    php7.1-xml  \
    php7.1-zip \
    php7.1-intl \
    php7.1-gmp \
    php7.1-mbstring  \
    php7.1-amqp  \
    php7.1-opcache \
    php7.1-soap \
    php7.1-gd &&\
    bash +x /usr/local/bin/install.sh && \
    pip install --upgrade pip; pip --version && \
    pip install supervisor && echo_supervisord_conf > /etc/supervisord.conf && \
    echo "daemon off;" >> /etc/nginx/nginx.conf && \
    sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.1/fpm/php-fpm.conf && \
    sed -i -e "s/nodaemon=false/nodaemon=true/g" /etc/supervisord.conf && \
    echo "files = /config/supervisor/*.conf" >> /etc/supervisord.conf && \
    sed -i -e "s/;\[include\]/\[include\]/g" /etc/supervisord.conf && \
    pecl install grpc && echo  "extension=grpc.so" > /etc/php/7.1/cli/conf.d/20-grpc.ini && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /run/php/



WORKDIR /root