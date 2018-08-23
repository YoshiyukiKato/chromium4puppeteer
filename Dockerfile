FROM node:9-alpine

ARG ALPINE_VERSION

# Installs latest Chromium (68) package.
RUN apk update && \
  apk upgrade && \
  echo @${ALPINE_VERSION} https://ftp.acc.umu.se/mirror/alpinelinux.org/${ALPINE_VERSION}/community >> /etc/apk/repositories && \
  echo @${ALPINE_VERSION} https://ftp.acc.umu.se/mirror/alpinelinux.org/${ALPINE_VERSION}/main >> /etc/apk/repositories && \
  apk add --no-cache \
    freetype@${ALPINE_VERSION} \
    harfbuzz@${ALPINE_VERSION} \
    chromium@${ALPINE_VERSION} \
    nss@${ALPINE_VERSION}