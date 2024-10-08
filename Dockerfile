FROM --platform=x86_64 rockylinux:9.3

ENV LANG=ja_JP.utf8
ENV TZ=Asia/Tokyo

WORKDIR /opt

RUN curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

RUN dnf update -y && dnf install -y \
    ./google-chrome-stable_current_x86_64.rpm \
    glibc-langpack-ja \
    langpacks-ja \
    vim \
    xz \
    && dnf clean all

RUN curl -O https://nodejs.org/dist/v20.17.0/node-v20.17.0-linux-x64.tar.xz \
    && tar -xf node-v20.17.0-linux-x64.tar.xz \
    && mv node-v20.17.0-linux-x64 /usr/local/node \
    && ln -s /usr/local/node/bin/node /usr/bin/node \
    && ln -s /usr/local/node/bin/npm /usr/bin/npm \
    && ln -s /usr/local/node/bin/corepack /usr/bin/corepack

RUN npm install -g yarn@1 \
    && ln -s /usr/local/node/bin/yarn /usr/bin/yarn

WORKDIR /app
