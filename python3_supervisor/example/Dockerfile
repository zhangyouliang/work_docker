FROM 1577121881/python3_supervisor:v0.0.2
MAINTAINER YouliangZhang <1577121881@qq.com>



# ------------------------------------------------------------------------------
# Provision the server
# ------------------------------------------------------------------------------
RUN mkdir /docker
ADD docker /docker

ADD . /app
RUN chmod a+x /docker/*.sh

# Use Supervisor to run and manage all other services
CMD ["/docker/start.sh"]

