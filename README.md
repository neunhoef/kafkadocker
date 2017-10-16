# Run Kafka in a docker container 

Build:
```
docker build -t kafka .
```

Usage:
```

# Plain text connections
export HOSTIP=<ip/dns name of the docker host>
docker run -d \
    -e KAFKA_ADVERTISED_HOST_NAME=$HOSTIP \
    -p 9092:9092 \
    ewoutp/kafka

# SSL only connections
docker run -d \
    -v mykeystore.jks:/certificates/keystore.jks:ro \
    -e KAFKA_ADVERTISED_HOST_NAME=$HOSTIP \
    -e KAFKA_SECURITY=ssl \
    -e KAFKA_KEYSTORE=/certificates/keystore.jks \
    -e KAFKA_KEYSTORE_PASSWORD=mySecretPassword \
    -p 9093:9093 \
    ewoutp/kafka
```
