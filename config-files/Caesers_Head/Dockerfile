FROM resin/raspberrypi3-debian:stretch
MAINTAINER Wyatt Miler <kj4ctd@wmiler.org>

RUN echo 'deb http://mirrordirector.raspbian.org/raspbian/ buster main' | sudo tee /etc/apt/sources.list.d/svxlink.list \
    && echo 'deb http://giteduberger.fr rpimonitor/' | sudo tee /etc/apt/sources.list.d/rpimonitor.list \
	&& apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F \
	&& apt-get update \
	&& apt-get install rpimonitor wget bzip2 curl \
	&& apt-get -t buster install svxlink-server \
	&& cd /usr/share/svxlink/sounds/ \
	&& wget https://github.com/sm0svx/svxlink-sounds-en_US-heather/releases/download/14.08/svxlink-sounds-en_US-heather-16k-13.12.tar.bz2 \
	&& tar xvjf svxlink-sounds-en_US-heather-16k-13.12.tar.bz2 \
	&& ln -s en_US-heather-16k en_US \
	&& curl -s -o "/tmp/svxlink/" -L \
        "https://github.com/w4nyk/controller/tree/master/config-files/Caesers_Head/svxlink" \
        && mv /tmp/svxlink/* /etc/svxlink/ \
	&& apt autoremove
	
ENTRYPOINT ["/bin/bash"]
