FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    make \
    curl \
    wget \
    mingw-w64 \
    gcc-arm-linux-gnueabihf \
    binutils \
    qemu-user-static \
    caca-utils \
    build-essential \
    linux-headers-5.4.0-42-generic \
    libc6-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./main/chameleon.sh /usr/local/bin/chameleon.sh
COPY ./main/chameleon.jpg /home/chameleon.jpg

RUN chmod +x /usr/local/bin/chameleon.sh

ENTRYPOINT ["/usr/local/bin/chameleon.sh"]
