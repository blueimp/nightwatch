#
# Nightwatch.js Dockerfile
#

FROM alpine:3.9

RUN apk --no-cache add \
    # Install NodeJS and NPM:
    nodejs \
    npm \
    # Install ffmpeg for video recording:
    ffmpeg \
  && npm install -g \
    # Install the latest NPM version:
    npm@latest \
  && npm install -g \
    # Install Nightwatch.js:
    nightwatch@'<1.0' \
  # Clean up obsolete files:
  && rm -rf \
    /tmp/* \
    /root/.npm

# Add node system user/group with uid/gid 1000.
RUN adduser -D -u 1000 node

USER node

WORKDIR /home/node

COPY wait-for.sh /usr/local/bin/wait-for
COPY entrypoint.sh /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]
