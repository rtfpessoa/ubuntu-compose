FROM rtfpessoa/ubuntu-jdk8:latest
MAINTAINER Rodrigo Fernandes <rodrigo.fernandes@tecnico.ulisboa.pt>

#
# Ubuntu with Oracle JDK 8 and docker-compose
#

RUN \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install python-pip python-dev build-essential && \
    pip install --upgrade pip && \
    pip install --upgrade virtualenv && \
    pip install --upgrade docker-compose && \
    apt-get -y clean && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/lib/dpkg/info/* && \
    rm -rf /var/cache/apt && \
    rm -rf /var/cache/oracle-jdk8-installer && \
    rm -rf /tmp/*
