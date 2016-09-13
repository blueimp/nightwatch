#
# Nightwatch.js Dockerfile
#

FROM alpine:3.4

MAINTAINER Sebastian Tschan <mail@blueimp.net>

RUN apk --no-cache add \
    # Install NodeJS:
    nodejs-lts \
    # Install tini, a tiny but valid init for containers:
    tini \
  && npm install -g \
    # Install Nightwatch.js:
    nightwatch@'<1.0' \
  # Clean up obsolete files:
  && rm -rf \
    /tmp/* \
    /root/.npm

# Add node system user/group with uid/gid 1000.
# This is a workaround for boot2docker issue #581, see
# https://github.com/boot2docker/boot2docker/issues/581
RUN adduser -D -u 1000 node

USER node

WORKDIR /home/node

COPY wait-for.sh /usr/local/bin/wait-for
COPY entrypoint.sh /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]
