#
# Nightwatch.js Dockerfile
#

FROM blueimp/node:0.12

MAINTAINER Sebastian Tschan <mail@blueimp.net>

USER root

# Install Nightwatch.js:
RUN npm install -g \
  nightwatch@'<0.8.0' \
  # Clean up obsolete files:
  && rm -rf \
    /tmp/* \
    /root/.npm

USER node

ENTRYPOINT ["nightwatch"]
