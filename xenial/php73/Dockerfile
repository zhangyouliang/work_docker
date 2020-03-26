FROM ubuntu:xenial
MAINTAINER "zyl <1577121881@qq.com>"

## 加速
COPY sources.list /etc/apt/sources.list
RUN mkdir ~/.pip
COPY pip.conf /root/.pip/pip.conf
## 加速

ENV DEBIAN_FRONTEND noninteractive
ENV TZ="Asia/Shanghai"

# https://github.com/thatsamguy/ubuntu-build-image/blob/master/xenial/php71/Dockerfile
RUN \
    apt-get update && \
    apt-get install -y language-pack-en-base && \
    export LC_ALL=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    apt-get install -y python-software-properties software-properties-common curl && \
    add-apt-repository ppa:ondrej/php && \
    apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8 && \
    echo "deb http://mirror.aarnet.edu.au/pub/MariaDB/repo/10.1/ubuntu xenial main" >> /etc/apt/sources.list.d/mariadb101.list && \
    echo "deb-src http://mirror.aarnet.edu.au/pub/MariaDB/repo/10.1/ubuntu xenial main" >> /etc/apt/sources.list.d/mariadb101.list && \
    apt-get update && \
    apt-get install -y \
    php7.3 \
    php7.3-cli \
    php7.3-dev \
    php7.3-fpm \
    php7.3-opcache \
    php7.3-bcmath \
    php7.3-bz2 \
    php7.3-common \
    php7.3-curl \
    php7.3-dba \
    php7.3-enchant \
    php7.3-gd \
    php7.3-imap \
    php7.3-json \
    php7.3-ldap \
    php7.3-mbstring \
    php7.3-pspell \
    php7.3-readline \
    php7.3-soap \
    php7.3-xml \
    php7.3-zip \
    php7.3-mysql \
    php-imagick \
    php-redis \
    php7.3-sybase \
    git \
    python-pip \
    vim \
    nginx \
    packaging-dev \
    dh-make \
    git-buildpackage \
    reprepro \
    libmariadbclient-dev \
    && pecl install -o -f swoole && echo 'extension=swoole.so' >> /etc/php/7.1/cli/conf.d/20-swoole.ini \
    && pip install libmcrypt-dev && pecl install mcrypt-1.0.1 \
    && pip install supervisor  \
    && echo_supervisord_conf > /etc/supervisord.conf \
    && echo "daemon off;" >> /etc/nginx/nginx.conf \
    && sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.1/fpm/php-fpm.conf \
    && sed -i -e "s/nodaemon=false/nodaemon=true/g" /etc/supervisord.conf \
    && echo "files = /config/supervisor/*.conf" >> /etc/supervisord.conf \
    && sed -i -e "s/;\[include\]/\[include\]/g" /etc/supervisord.conf \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone \
    && mkdir /run/php/ \
    && \
    apt-get remove -y python-software-properties software-properties-common && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /srv
