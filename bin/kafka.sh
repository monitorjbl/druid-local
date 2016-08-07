#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/_common.rc

$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties | tee $DIR/../logs/kafka.log