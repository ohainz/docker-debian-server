# Server

This repository contains a docker file based on a debian slim image. It tries to start a vnc server session on a xfce4 desktop. To have there preinstalled applications. Currently this did not work. For example the browser chromium did not start (chromium --no-sandbox works).

## Preparation

On Linux install docker:

```sh
sudo apt update
sudo apt upgrade -y
sudo apt install git
sudo apt install docker docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

## Commands

```sh
docker build --no-cache -t debian-server:1.0.0 -f dockerfile .
docker run -p 1180:80 -p 15901:5901 -td debian-server:1.0.0
docker run -p 1180:80 -p 15901:5901 -it debian-server:1.0.0
docker ps
docker exec -it $CONTAINER_ID /bin/bash
```

## Links

- [Create a Debian Container in Docker](https://jolthgs.wordpress.com/2019/09/25/create-a-debian-container-in-docker-for-development/)