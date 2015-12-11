FROM gengmao/carbon-base

RUN apt-get -y install supervisor

ENV RELAY_METHOD consistent-hashing
ENV DESTINATIONS localhost:2004
ENV REPLICATION_FACTOR 1

ADD ./config/carbon.conf /opt/graphite/conf/carbon.conf
ADD ./config/relay-rules.conf /opt/graphite/conf/relay-rules.conf
ADD ./config/storage-aggregation.conf /opt/graphite/conf/storage-aggregation.conf
ADD ./config/storage-schemas.conf /opt/graphite/conf/storage-schemas.conf
ADD ./config/supervisord.conf /etc/supervisor/supervisord.conf
ADD ./script /opt/graphite/bin/

EXPOSE 2003 2004

WORKDIR /opt/graphite

CMD ["/opt/graphite/bin/start_carbon_relay.sh"]
