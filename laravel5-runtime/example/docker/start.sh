#!/bin/bash

#根据环境变量启动镜像
/docker/config.sh


#启动守护
/usr/local/bin/supervisord -c /etc/supervisord.conf

