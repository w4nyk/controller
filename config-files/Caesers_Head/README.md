# Caesers Head Repeater Controller

## Config files
The svxlink and rpimonitor directories should be placed in ```/etc``` Please make sure you set the password in ```svxlink/svxlink.d/ModuleEchoLink.conf``` or EchoLink will **NOT** work.

## rrdFiles
The rrdFiles directory holds xml examples of the round robin databases that are enabled as of May 28, 2018.

## Dockerfiles
The initial Dockerfile is runable on Win10, as it includes qemu-user-static in the image. Your mileage may vary, don't expect to be able to control any actual hardware. This image, after being built, **CAN** run on a rpi3 under rpi-docker.

The Dockerfile installs rpi-monitor and svxlink. Additionally, a root-enabled entry point is provided.

### Building the Dockerfile and running the image
To build the image from the Dockerfile, and then run it, you can try the script located in the top-level utils directory [create-container.bash](https://github.com/w4nyk/controller/blob/master/utils/create-container.bash)

Please note, ports aren't working quite right, again, it's on the TODO.

