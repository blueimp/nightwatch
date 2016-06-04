#
# Nightwatch.js Dockerfile
#

FROM blueimp/node:4.4

MAINTAINER Sebastian Tschan <mail@blueimp.net>

USER root

# Install Nightwatch.js:
RUN npm install -g \
  nightwatch@'<1.0' \
  # Clean up obsolete files:
  && rm -rf \
    /tmp/* \
    /root/.npm

USER node

ENTRYPOINT ["tini", "--", "nightwatch"]
