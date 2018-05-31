# Caesers Head Repeater Controller

## Setup
After you have setup your rpi3b+, as per the manufacturer's instructions, you will need to do a few more things to able to install the config files. 

Login to the pi, and execute the following commands

```sudo echo 'deb http://mirrordirector.raspbian.org/raspbian/ buster main' | tee /etc/apt/sources.list.d/svxlink.list```

  ```sudo echo 'deb http://giteduberger.fr rpimonitor/' | tee /etc/apt/sources.list.d/rpimonitor.list \ 
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
  && cp -R /tmp/controller-0.01/config-files/Caesers_Head/rpimonitor/* /etc/rpimonitor/```
```
## Config files
The svxlink and rpimonitor directories should be placed in ```/etc``` Please make sure you set the password in ```svxlink/svxlink.d/ModuleEchoLink.conf``` or EchoLink will **NOT** work.

## rrdFiles
The rrdFiles directory holds xml examples of the round robin databases that are enabled as of May 28, 2018.

## Dockerfiles
The initial Dockerfile is runable on Win10, as it includes qemu-user-static in the image. Your mileage may vary, don't expect to be able to control any actual hardware. This image, after being built, **CAN** run on a rpi3 under rpi-docker.

The Dockerfile installs rpi-monitor and svxlink. Additionally, a root-enabled entry point is provided.

### Building the Dockerfile and running the image
To build the image from the Dockerfile, and then run it, you can try the script located in the top-level utils directory [create-container.bash](https://github.com/w4nyk/controller/blob/master/utils/create-container.bash)

Please note, ports aren't working quite right, it's on the TODO.

