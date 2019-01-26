FROM ubuntu:16.04
MAINTAINER zyl <1577121881@qq.com>

ENV TZ="Asia/Shanghai"
RUN apt-get update && locale-gen en_US.UTF-8 \
    &&  LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php \
    &&  apt-get update

RUN apt-get install -y  apt-utils language-pack-en-base curl wget php-pear software-properties-common \
    vim nginx  python python-pip python-dev build-essential \
    php7.1-dev  php7.1  php7.1-redis php7.1-mcrypt  php7.1-fpm php7.1-mysql php7.1-curl php7.1-xml  \
    php7.1-zip php7.1-intl php7.1-gmp php7.1-mbstring  php7.1-amqp  php7.1-opcache php7.1-soap php7.1-gd redis-server \
    && pecl install -o -f swoole \
    && pip install --upgrade pip; pip --version \
    && pip install supervisor
# 开启配置,貌似仅 php系列镜像支持
# docker-php-ext-enable swoole
RUN echo_supervisord_conf > /etc/supervisord.conf \
    && echo "daemon off;" >> /etc/nginx/nginx.conf \
    && echo 'extension=swoole.so' >> /etc/php/7.1/cli/conf.d/20-swoole.ini \
    && sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.1/fpm/php-fpm.conf \
    && sed -i -e "s/nodaemon=false/nodaemon=true/g" /etc/supervisord.conf \
    && echo "files = /config/supervisor/*.conf" >> /etc/supervisord.conf \
    && sed -i -e "s/;\[include\]/\[include\]/g" /etc/supervisord.conf \
    && mkdir /run/php/


WORKDIR /root