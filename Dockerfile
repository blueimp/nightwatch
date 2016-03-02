#
# Nightwatch.js Dockerfile
#

FROM blueimp/node:4.3

MAINTAINER Sebastian Tschan <mail@blueimp.net>

USER root

# Install Nightwatch.js:
RUN npm install -g \
  nightwatch@'<0.9' \
  # Clean up obsolete files:
  && rm -rf \
    /tmp/* \
    /root/.npm

USER node

ENTRYPOINT ["nightwatch"]
