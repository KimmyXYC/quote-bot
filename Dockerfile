FROM nikolaik/python-nodejs:python3.12-nodejs21 AS builder

ENV NODE_WORKDIR /app
WORKDIR $NODE_WORKDIR

ADD . $NODE_WORKDIR

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN apt-get update && apt-get install -y build-essential gcc wget git libvips && rm -rf /var/lib/apt/lists/*
RUN wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.20_amd64.deb && dpkg -i libssl1.1_1.1.1f-1ubuntu2.20_amd64.deb

RUN npm install && npm install sharp@0.33.2 && npm install tdl-tdlib-addon --build-from-source
