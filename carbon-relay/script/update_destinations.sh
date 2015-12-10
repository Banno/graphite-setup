#!/bin/bash

sed -i -e "s/\(RELAY_METHOD\).*$/\1 = ${RELAY_METHOD}/g" /opt/graphite/conf/carbon.conf
sed -i -e "s/\(REPLICATION_FACTOR\).*$/\1 = ${REPLICATION_FACTOR}/g" /opt/graphite/conf/carbon.conf
if [ -n "$DESTINATIONS" ]; then
  sed -i -e "s/\(DESTINATIONS\).*$/\1 = ${DESTINATIONS}/g" /opt/graphite/conf/carbon.conf
fi

/usr/bin/supervisorctl restart carbon-relay
