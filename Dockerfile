#
# Nightwatch.js Dockerfile
#

FROM alpine:3.9

RUN apk --no-cache add \
    nodejs \
    npm \
    ffmpeg \
  && npm install -g \
    npm@latest \
    nightwatch@'<1.1' \
    nightwatch-video-recorder@^3.0.0 \
  # Clean up obsolete files:
  && rm -rf \
    /tmp/* \
    /root/.npm

# Set NODE_PATH to be able to require globally installed packages:
ENV NODE_PATH=/usr/lib/node_modules

# Avoid permission issues with host mounts by assigning a user/group with
# uid/gid 1000 (usually the ID of the first user account on GNU/Linux):
RUN adduser -D -u 1000 nightwatch

USER nightwatch

WORKDIR /home/nightwatch

COPY wait-for.sh /usr/local/bin/wait-for

ENTRYPOINT ["wait-for", "--", "nightwatch"]
