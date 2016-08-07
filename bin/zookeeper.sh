#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/_common.rc

$ZOOKEEPER_HOME/bin/zkServer.sh start-foreground | tee $DIR/../logs/zookeeper.log