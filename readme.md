# Server

## Preparation

On Windows install wsl:

On Linux install docker:

```sh
sudo apt update
sudo apt update 
```

## Commands

```sh
docker build --no-cache -t debian-server:1.0.0 -f dockerfile .
docker run -p 1180:80 -p 15901:5901 -td debian-server:1.0.0
docker ps
docker exec -it $CONTAINER_ID /bin/bash
```

## Links

- [Create a Debian Container in Docker](https://jolthgs.wordpress.com/2019/09/25/create-a-debian-container-in-docker-for-development/)