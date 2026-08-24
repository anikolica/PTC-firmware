FROM crops/poky:ubuntu-22.04

USER root

RUN apt-get update && apt-get install -y \
    libtinfo5 \
    libncurses5 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir "websockets>=11.0"
