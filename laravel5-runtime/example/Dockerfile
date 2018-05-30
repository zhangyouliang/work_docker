FROM dingshoukun/laravel5-runtime:1.0.1
MAINTAINER dsk <393573645@qq.com>



# ------------------------------------------------------------------------------
# Provision the server
# ------------------------------------------------------------------------------
RUN mkdir /docker
ADD docker /docker
RUN mkdir -p /share/jfq
ADD . /share/jfq
RUN /docker/run.sh
RUN echo  "opcache.revalidate_freq=60" >> /etc/php/7.1/cli/conf.d/10-opcache.ini

# Use Supervisor to run and manage all other services
CMD ["/docker/start.sh"]

