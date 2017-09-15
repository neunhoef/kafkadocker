FROM ubuntu:17.04
MAINTAINER Ewout Prangsma

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        openjdk-8-jre \
    && \
    rm -rf /var/lib/apt/lists/*

ADD ./kafka_2.11-0.11.0.0.tgz /
COPY ./scripts /scripts
COPY ./config /config

ENTRYPOINT [ "/scripts/start.sh" ]
CMD [ "serve" ]
