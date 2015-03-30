FROM ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y install python wget

# grafana
ENV GRAFANA_VERSION="1.9.0"
RUN cd /opt && \
    wget -q http://grafanarel.s3.amazonaws.com/grafana-$GRAFANA_VERSION.tar.gz && \
    tar xzvf grafana-$GRAFANA_VERSION.tar.gz && rm grafana-$GRAFANA_VERSION.tar.gz && \
    mv grafana-$GRAFANA_VERSION /opt/grafana

# config file
ADD config/config.js /opt/grafana/config.js

WORKDIR /opt/grafana

EXPOSE 8081

CMD ["python", "-m", "SimpleHTTPServer", "8081"]
