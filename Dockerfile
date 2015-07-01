#
# Nightwatch.js Dockerfile
#

FROM blueimp/node:0.12

MAINTAINER Sebastian Tschan <mail@blueimp.net>

ENV NIGHTWATCH_VERSION 0.7.5

USER root

# Install Nightwatch.js:
RUN npm install -g \
  nightwatch@$NIGHTWATCH_VERSION \
  # Clean up obsolete files:
  && rm -rf \
    /tmp/* \
    /root/.npm

USER node

ENTRYPOINT ["nightwatch"]
