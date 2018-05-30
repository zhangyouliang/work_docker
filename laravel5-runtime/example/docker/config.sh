#!/bin/bash

#根据环境变量启动镜像
sed -i -e "s|JFQDOMAIN|$JFQDOMAIN|g" /etc/nginx/sites-enabled/jfq.conf

#应该是基础镜像的bug
sed -i -e "s/;\[include\]/\[include\]/g" /etc/supervisord.conf
sed -i -e "s/files\ \=\ \/config\/supervisor\/\*\.conf/files\ \=\ \/docker\/supervisor\/\*\.conf/g" /etc/supervisord.conf
