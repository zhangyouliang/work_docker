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
    php7.1 \
    php7.1-cli \
    php7.1-dev \
    php7.1-fpm \
    php7.1-opcache \
    php7.1-bcmath \
    php7.1-bz2 \
    php7.1-common \
    php7.1-curl \
    php7.1-dba \
    php7.1-enchant \
    php7.1-gd \
    php7.1-imap \
    php7.1-json \
    php7.1-ldap \
    php7.1-mbstring \
    php7.1-mcrypt \
    php7.1-pspell \
    php7.1-readline \
    php7.1-soap \
    php7.1-xml \
    php7.1-zip \
    php7.1-mysql \
    php-imagick \
    php-redis \
    php7.1-sybase \
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
    && pip install supervisor  \
    && echo_supervisord_conf > /etc/supervisord.conf \
    && echo "daemon off;" >> /etc/nginx/nginx.conf \
    && echo 'extension=swoole.so' >> /etc/php/7.1/cli/conf.d/20-swoole.ini \
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