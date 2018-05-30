FROM resin/raspberrypi3-debian:stretch
MAINTAINER Wyatt Miler <kj4ctd@wmiler.org>

ENV CH_VERSION 0.01

RUN echo 'deb http://mirrordirector.raspbian.org/raspbian/ buster main' | tee /etc/apt/sources.list.d/svxlink.list \
    && echo 'deb http://giteduberger.fr rpimonitor/' | tee /etc/apt/sources.list.d/rpimonitor.list \
	&& apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F \
	&& apt-get update \
	&& apt-get install rpimonitor wget bzip2 curl \
	&& apt-get -t buster install svxlink-server \
	&& cd /usr/share/svxlink/sounds/ \
	&& wget https://github.com/sm0svx/svxlink-sounds-en_US-heather/releases/download/14.08/svxlink-sounds-en_US-heather-16k-13.12.tar.bz2 \
	&& tar xjf svxlink-sounds-en_US-heather-16k-13.12.tar.bz2 \
	&& ln -s en_US-heather-16k en_US \
	&& curl -s -o "/tmp/svxlink/" -L "https://github.com/w4nyk/controller/archive/${CH_VERSION}.tar.gz" \
	&& tar zxf "/tmp/${CH_VERSION}.tar.gz" -C /tmp/ \
        && cp -R /tmp/controller-0.01/config-files/Caesers_Head/svxlink/* /etc/svxlink/ \
        && cp -R /tmp/controller-0.01/config-files/Caesers_Head/rpimonitor/* /etc/rpimonitor/ \
	&& apt autoremove
	
ENTRYPOINT ["/bin/bash"]
