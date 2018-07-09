#!/bin/bash


sed -i -e "s/nodaemon=false/nodaemon=true /g" /etc/supervisord.conf
sed -i -e "s/;\[include\]/\[include\]/g" /etc/supervisord.conf
echo 'files=/docker/supervisor/*.conf' >>  /etc/supervisord.conf
