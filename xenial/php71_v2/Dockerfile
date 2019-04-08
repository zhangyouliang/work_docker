FROM registry.cn-hangzhou.aliyuncs.com/zhangyouliang/php71:1.0
MAINTAINER zyl <1577121881@qq.com>

COPY install.sh /usr/local/bin/install.sh

RUN \
    apt-get update && \
    bash +x /usr/local/bin/install.sh && \
    pecl install grpc && echo  "extension=grpc.so" > /etc/php/7.1/cli/conf.d/20-grpc.ini && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /srv
