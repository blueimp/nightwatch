#
# Nightwatch.js Dockerfile
#

FROM alpine:3.8

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

# Avoid permission issues with host mounts by assigning a user/group with
# uid/gid 1000 (usually the ID of the first user account on GNU/Linux):
RUN adduser -D -u 1000 node

USER node

WORKDIR /home/node

COPY wait-for.sh /usr/local/bin/wait-for
COPY entrypoint.sh /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]
