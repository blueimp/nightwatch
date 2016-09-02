#!/bin/sh

exec /sbin/tini -g -- \
  wait-for --timeout $WAIT_FOR_TIMEOUT $WAIT_FOR_HOSTS -- \
  nightwatch "$@"
