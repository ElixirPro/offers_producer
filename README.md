

docker-compose exec kafka  \
kafka-topics --create --topic ofertas --partitions 3 --replication-factor 1 --if-not-exists --zookeeper zookeeper:2181

docker-compose exec kafka  \
kafka-topics --describe --topic ofertas --zookeeper zookeeper:2181

docker-compose exec kafka  \
   bash -c "seq 100 | kafka-console-producer --request-required-acks 1 --broker-list kafka:9092 --topic ofertas && echo 'Produced 100 messages.'"

docker-compose exec kafka  \
  kafka-console-consumer --bootstrap-server kafka:9092 --topic ofertas --from-beginning --max-messages 100
