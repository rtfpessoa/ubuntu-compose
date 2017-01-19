FROM rtfpessoa/ubuntu-jdk8:latest
MAINTAINER Rodrigo Fernandes <rodrigo.fernandes@tecnico.ulisboa.pt>

#
# Ubuntu with Oracle JDK 8 and docker-compose
#

RUN \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install wget build-essential checkinstall libgmp3-dev && \
    apt-get -y install python3 python3-dev python3-pip libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev && \
    python3 -m pip install --upgrade --ignore-installed pip && \
    python3 -m pip install --upgrade --ignore-installed --no-cache-dir docker-compose===1.10.0 && \
    apt-get -y remove build-essential && \
    apt-get -y autoremove && \
    apt-get -y autoclean && \
    apt-get -y clean && \
    apt-get -y purge $(apt-cache search '~c' | awk '{ print $2 }') && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt && \
    rm -rf /var/cache/oracle-jdk8-installer && \
    rm -rf /tmp/*
