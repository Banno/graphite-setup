#!/bin/bash

sed -i -e "s/\[cache\]/\[${NODE_NAME}\]/g" ./conf/carbon.conf
sed -i -e "s/\(LINE_RECEIVER_INTERFACE\).*$/\1 = ${LINE_RECEIVER_INTERFACE}/g" ./conf/carbon.conf
sed -i -e "s/\(LINE_RECEIVER_PORT\).*$/\1 = ${LINE_RECEIVER_PORT}/g" ./conf/carbon.conf
sed -i -e "s/\(PICKLE_RECEIVER_INTERFACE\).*$/\1 = ${PICKLE_RECEIVER_INTERFACE}/g" ./conf/carbon.conf
sed -i -e "s/\(PICKLE_RECEIVER_PORT\).*$/\1 = ${PICKLE_RECEIVER_PORT}/g" ./conf/carbon.conf
sed -i -e "s/\(RELAY_METHOD\).*$/\1 = ${RELAY_METHOD}/g" ./conf/carbon.conf
sed -i -e "s/\(DESTINATIONS\).*$/\1 = ${DESTINATIONS}/g" ./conf/carbon.conf

/opt/graphite/bin/carbon-relay.py --debug "$@" start
