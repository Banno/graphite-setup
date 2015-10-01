FROM ubuntu:14.04

ENV GRAPHITE_VERSION 0.9.13

RUN apt-get update && \
    apt-get -y install python-dev python-pip

RUN pip install https://github.com/graphite-project/ceres/tarball/master && \
    pip install whisper==$GRAPHITE_VERSION && \
    pip install carbon==$GRAPHITE_VERSION && \
    pip install graphite-web==$GRAPHITE_VERSION
