FROM ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y install adduser libfontconfig wget

# grafana
RUN cd /tmp && \
    wget -q https://grafanarel.s3.amazonaws.com/builds/grafana_2.0.2_amd64.deb && \
    dpkg -i grafana_2.0.2_amd64.deb

EXPOSE 3000

WORKDIR /usr/share/grafana

ENTRYPOINT ["/usr/sbin/grafana-server", "--config", "/etc/grafana/grafana.ini"]
