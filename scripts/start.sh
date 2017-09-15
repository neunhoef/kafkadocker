#!/bin/bash

export KAFKA_PORT=${KAFKA_PORT:-9092}
export KAFKA_ADVERTISED_LISTENERS="PLAINTEXT://${KAFKA_ADVERTISED_HOST_NAME-}:${KAFKA_ADVERTISED_PORT-$KAFKA_PORT}"
export KAFKA_LISTENERS="PLAINTEXT://${KAFKA_HOST_NAME-}:${KAFKA_PORT-9092}"

sed -i -e "s|_KAFKA_LISTENERS_|${KAFKA_LISTENERS}|g" /config/server.properties 
sed -i -e "s|_KAFKA_ADVERTISED_LISTENERS_|${KAFKA_ADVERTISED_LISTENERS}|g" /config/server.properties 

if [ "$1" == "serve" ] ; then
    cd /kafka_2.11-0.11.0.0

    if [[ -z "$KAFKA_ADVERTISED_HOST_NAME" ]]; then
        echo KAFKA_ADVERTISED_HOST_NAME missing
        exit 1
    fi

    echo Starting zookeeper on port 2181...
    bin/zookeeper-server-start.sh /config/zookeeper.properties > /tmp/zookeeper.log &
    sleep 5

    echo Starting kafka on port 9092...
    bin/kafka-server-start.sh /config/server.properties > /tmp/kafka.log
else
    export PATH=/kafka_2.11-0.11.0.0/bin:$PATH
    exec "$@"
fi
