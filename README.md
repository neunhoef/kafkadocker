# Run Kafka in a docker container 

Usage:
```
export HOSTIP=<ip/dns name of the docker host>
docker run -d -e KAFKA_ADVERTISED_HOST_NAME=$HOSTIP -p 9092:9092 ewoutp/kafka
```
