#!/bin/bash

git clone https://github.com/longxinH/xhprof.git /srv/xhprof
cd /srv/xhprof/extension/ && phpize && ./configure && make && make install

cat <<EOF >> /etc/php/7.1/cli/php.ini
[xhprof]
extension = xhprof.so
xhprof.output_dir = /var/log/xhprof
EOF

rm -rf /srv/xhprof
