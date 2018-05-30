#!/bin/bash


#拷贝nginx的模板
cp /docker/jfq.conf /etc/nginx/sites-enabled/jfq.conf
# 替换 nginx 配置
rm -rf /etc/nginx/nginx.conf
cp /docker/nginx.conf /etc/nginx/nginx.conf

#删除nginx的默认配置
rm -rf /etc/nginx/sites-enabled/default


#临时文件和文件权限
chmod -R 777 /share/jfq/storage
chmod -R 777 /share/jfq/bootstrap
chmod -R 777 /share/jfq/public/upload
chmod -R 777 /share/jfq/public/qrcodes




#开启php-fpm使用docker的环境变量
sed -i -e "s/;clear_env\s*=\s*no/clear_env = no/g" /etc/php/7.1/fpm/pool.d/www.conf
sed -i -e "s/;pm\.max_requests\s*=\s*500/pm.max_requests = 2000/g" /etc/php/7.1/fpm/pool.d/www.conf
sed -i -e "s/pm\s*=\s*dynamic/pm = static/g" /etc/php/7.1/fpm/pool.d/www.conf
sed -i -e "s/pm\.max_children\s*=\s*5/pm.max_children = 800/g" /etc/php/7.1/fpm/pool.d/www.conf

#增加nginx日志
#sed -i '33d' /etc/nginx/nginx.conf
#sed -i "32i\log_format  main \"\$remote_addr - \$remote_user [$time_local] \$request $status \$body_bytes_sent \$http_referer \$http_user_agent \$http_x_forwarded_for \$upstream_addr  \$request_time \";"  /etc/nginx/nginx.conf
#sed -i '33i\access_log /var/log/nginx/access.log main;'  /etc/nginx/nginx.conf
#cp /docker/nginx.conf /etc/nginx/nginx.conf

#xdebug

#echo "xdebug.profiler_enable=1" >> /etc/php/7.1/cli/conf.d/20-xdebug.ini
