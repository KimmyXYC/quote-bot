FROM nikolaik/python-nodejs:python3.12-nodejs21-slim AS builder

WORKDIR /app

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN apt-get update && \
apt-get install -y build-essential gcc wget git libvips && \
rm -rf /var/lib/apt/lists/* && \
wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.21_amd64.deb && \
dpkg -i libssl1.1_1.1.1f-1ubuntu2.21_amd64.deb

ADD . $NODE_WORKDIR

RUN npm install && npm install sharp@0.33.2 && npm install tdl-tdlib-addon --build-from-source
