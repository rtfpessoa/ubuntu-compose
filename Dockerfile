FROM rtfpessoa/ubuntu-jdk8:latest
MAINTAINER Rodrigo Fernandes <rodrigo.fernandes@tecnico.ulisboa.pt>

#
# Ubuntu with Oracle JDK 8 and docker-compose
#

RUN \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install wget build-essential checkinstall libgmp3-dev python-dev && \
    wget https://bootstrap.pypa.io/ez_setup.py -O - | sudo python && \
    rm -rf setuptools*.zip && \
    rm -f ez_setup.py && \
    easy_install pip && \
    pip install --upgrade --upgrade --ignore-installed --no-cache-dir pip && \
    pip install --upgrade --upgrade --ignore-installed --no-cache-dir virtualenv && \
    pip install --upgrade --upgrade --ignore-installed --no-cache-dir docker-compose && \
    apt-get -y clean && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    apt-get purge -y $(apt-cache search '~c' | awk '{ print $2 }') && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt && \
    rm -rf /var/cache/oracle-jdk8-installer && \
    rm -rf /tmp/*
