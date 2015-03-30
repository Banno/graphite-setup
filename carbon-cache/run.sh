#!/bin/bash

sed -i -e "s/\[cache\]/\[${NODE_NAME}\]/g" ./conf/carbon.conf
sed -i -e "s/\(LOCAL_DATA_DIR\).*$/\1 = $(printf "${LOCAL_DATA_DIR}" | sed -e 's/\//\\\//g')/g" ./conf/carbon.conf
sed -i -e "s/\(MAX_CACHE_SIZE\).*$/\1 = ${MAX_CACHE_SIZE}/g" ./conf/carbon.conf
sed -i -e "s/\(MAX_UPDATES_PER_SECOND\).*$/\1 = ${MAX_UPDATES_PER_SECOND}/g" ./conf/carbon.conf
sed -i -e "s/\(MAX_CREATES_PER_MINUTE\).*$/\1 = ${MAX_CREATES_PER_MINUTE}/g" ./conf/carbon.conf
sed -i -e "s/\(LOG_UPDATES\).*$/\1 = ${LOG_UPDATES}/g" ./conf/carbon.conf
sed -i -e "s/\(LINE_RECEIVER_INTERFACE\).*$/\1 = ${LINE_RECEIVER_INTERFACE}/g" ./conf/carbon.conf
sed -i -e "s/\(PICKLE_RECEIVER_INTERFACE\).*$/\1 = ${PICKLE_RECEIVER_INTERFACE}/g" ./conf/carbon.conf
sed -i -e "s/\(CACHE_QUERY_INTERFACE\).*$/\1 = ${CACHE_QUERY_INTERFACE}/g" ./conf/carbon.conf
sed -i -e "s/\(LINE_RECEIVER_PORT\).*$/\1 = ${LINE_RECEIVER_PORT}/g" ./conf/carbon.conf
sed -i -e "s/\(PICKLE_RECEIVER_PORT\).*$/\1 = ${PICKLE_RECEIVER_PORT}/g" ./conf/carbon.conf
sed -i -e "s/\(CACHE_QUERY_PORT\).*$/\1 = ${CACHE_QUERY_PORT}/g" ./conf/carbon.conf

/opt/graphite/bin/carbon-cache.py --debug "$@" start
