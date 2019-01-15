# tor-privoxy [![Docker Pulls](https://img.shields.io/docker/pulls/foifirst/tor-privoxy-for-telegram.svg)](https://hub.docker.com/r/foifirst/tor-privoxy-for-telegram/) [![Docker Stars](https://img.shields.io/docker/stars/foifirst/tor-privoxy-for-telegram.svg?style=flat)](https://hub.docker.com/r/foifirst/tor-privoxy-for-telegram/) [![MicroBadger](https://images.microbadger.com/badges/image/foifirst/tor-privoxy-for-telegram.svg)](https://microbadger.com/images/foifirst/tor-privoxy-for-telegram) [![Docker Build Status](https://img.shields.io/docker/build/foifirst/tor-privoxy-for-telegram.svg)](https://hub.docker.com/r/foifirst/tor-privoxy-for-telegram/) [![Docker Automated build](https://img.shields.io/docker/automated/foifirst/tor-privoxy-for-telegram.svg)](https://hub.docker.com/r/foifirst/tor-privoxy-for-telegram/)

This image combines Tor and Privoxy services to prepare proxy connection for http and shell (for Telegram).


## Contributing

If you find this image useful here's how you can help:

- Send a pull request with your awesome features and bug fixes
- Help users resolve their [issues](../../issues?q=is%3Aopen+is%3Aissue).

## Issues

Before reporting your issue please try updating Docker to the latest version and check if it resolves the issue. Refer to the Docker [installation guide](https://docs.docker.com/installation) for instructions.

SELinux users should try disabling SELinux using the command `setenforce 0` to see if it resolves the issue.

If the above recommendations do not help then [report your issue](../../issues/new) along with the following information:

- Output of the `docker vers6` and `docker info` commands
- The `docker run` command or `docker-compose.yml` used to start the image. Mask out the sensitive bits.
- Please state if you are using [Boot2Docker](http://www.boot2docker.io), [VirtualBox](https://www.virtualbox.org), etc.

# Getting started

## Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/r/foifirst/tor-privoxy-for-telegram) and is the recommended method of installation.

```bash
docker pull foifirst/tor-privoxy-for-telegram
```

Alternatively you can build the image yourself.

```bash
docker build -t foifirst/tor-privoxy-for-telegram github.com/foifirst/tor-privoxy-for-telegram
```


# Quick Start

The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/).

```bash
wget https://raw.githubusercontent.com/foifirst/tor-privoxy-for-telegram/master/docker-compose.yml
docker-compose up
```

Alternately, you can manually launch the `tor-privoxy` container.

```bash
docker run --name='tor-privoxy' -d \
  -p 9050:9050 \
  -p 9051:9051 \
  -p 8118:8118 \
foifirst/tor-privoxy-for-telegram:latest
```

# Maintenance

## Upgrading

To upgrade to newer releases:

- **Step 1**: Download the updated Docker image:
```bash
docker pull foifirst/tor-privoxy-for-telegram
```

- **Step 2**: Stop the currently running image:
```bash
docker stop tor-privoxy
```

- **Step 3**: Remove the stopped container
```bash
docker rm -v tor-privoxy
```

- **Step 4**: Start the updated image
```bash
docker run --name tor-privoxy -d \
[OPTIONS] \
foifirst/tor-privoxy-for-telegram:latest
```

## Shell Access

For debugging and maintenance purposes you may want access the containers shell. If you are using Docker version `1.3.0` or higher you can access a running containers shell by starting `bash` using `docker exec`:

```bash
docker exec -it tor-privoxy sh
```
