FROM ubuntu:14.04
MAINTAINER Infrastructure <infrastructure@banno.com>

ENV GCC_VERSION=4:4.8.2-1ubuntu6
ENV PYTHON_DEV_VERSION=2.7.5-5ubuntu3
ENV PYTHON_PIP_VERSION=1.5.4-1ubuntu4

# also, depends on https://github.com/graphite-project/carbon/pull/486
# once 0.9.16 is released, no need for special carbon install belos
ENV GRAPHITE_VERSION 0.9.15

RUN apt-get update && \
    apt-get install -y --no-install-recommends "gcc=$GCC_VERSION" "python-dev=$PYTHON_DEV_VERSION" "python-pip=$PYTHON_PIP_VERSION" && \
    pip install "whisper==$GRAPHITE_VERSION" && \
    pip install "graphite-web==$GRAPHITE_VERSION" && \
    pip install https://github.com/Banno/carbon/tarball/0.9.x-fix-events-callback && \
    apt-get autoremove -y gcc && \
    rm -rf /var/lib/apt/lists/*
