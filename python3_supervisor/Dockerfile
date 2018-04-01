FROM python:3.6.3
MAINTAINER YouliangZhang <1577121881@qq.com>


WORKDIR /app
COPY requirements.txt /app

RUN pip install --trusted-host pypi.python.org -r requirements.txt \
    && pip install virtualenv \
    && virtualenv --system-site-packages -p python2.7 /opt/python2.7 \
    && /opt/python2.7/bin/pip install supervisor \
    && /opt/python2.7/bin/echo_supervisord_conf > /etc/supervisord.conf

