#!/bin/bash
if [ "$1" == "serve" ] ; then
    cd /kafka_2.11-0.11.0.0

    echo Starting zookeeper on port 2181...
    bin/zookeeper-server-start.sh /config/zookeeper.properties > /tmp/zookeeper.log &
    sleep 5

    echo Starting kafka on port 9092...
    bin/kafka-server-start.sh /config/server.properties > /tmp/kafka.log
else
    export PATH=/kafka_2.11-0.11.0.0/bin:$PATH
    exec "$@"
fi
