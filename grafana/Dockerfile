FROM ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y install python wget

# grafana
RUN cd /opt && \
    wget http://grafanarel.s3.amazonaws.com/grafana-1.9.0.tar.gz && \
    tar xzvf grafana-1.9.0.tar.gz && rm grafana-1.9.0.tar.gz && \
    mv grafana-1.9.0 /opt/grafana

# config file
ADD config/config.js /opt/grafana/config.js

# dashboards
#ADD ./dashboards/annotations.json /src/grafana/app/dashboards/annotations.json

WORKDIR /opt/grafana

EXPOSE 8081

CMD ["python", "-m", "SimpleHTTPServer", "8081"]
