FROM debian:trixie
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y npm nodejs git sudo rpm \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g electron-builder
