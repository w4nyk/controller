#!/bin/bash
docker run -it --rm --privileged multiarch/qemu-user-static:register --reset
docker build -t 61 .
docker run -it -p 8888:8888 --rm --privileged --name 61-run 61
