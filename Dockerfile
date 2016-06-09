#
# Nightwatch.js Dockerfile
#

FROM alpine:3.4

RUN apk --no-cache add \
    # Install NodeJS:
    nodejs-lts'<'4.5 \
  && npm install -g \
    # Install Nightwatch.js:
    nightwatch@'<1.0' \
  # Clean up obsolete files:
  && rm -rf \
    /tmp/* \
    /root/.npm

# Add node system group/user with gid/uid 1000.
# This is a workaround for boot2docker issue #581, see
# https://github.com/boot2docker/boot2docker/issues/581
RUN addgroup -g 1000 node \
  && adduser -D -u 1000 -G node node

USER node

WORKDIR /home/node

ENTRYPOINT ["nightwatch"]
