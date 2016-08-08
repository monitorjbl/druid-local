#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PATHS=(index.html help.html about.html order.html cart.html profile.html login.html logout.html search.html support.html)
USERS=(user1 user2 user3 user4 user5 user6 user7 user8 user9 admin)

while [ true ]; do 
  TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  RND_PATH=${PATHS[$((RANDOM % 9))]}
  RND_USER=${USERS[$((RANDOM % 9))]}
  RND_SIZE=$((RANDOM % 4096))
  RND_TIME=$((RANDOM % 1000))
  echo "{\"timestamp\":\"$TIMESTAMP\",\"user\":\"$RND_USER\",\"path\":\"$RND_PATH\",\"bytes\":$RND_SIZE, \"duration\":$RND_TIME}"; 
  sleep 0.1
done | tee -a $DIR/../test/requests.txt | /Tools/kafka_2.11-0.10.0.0/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic metrics