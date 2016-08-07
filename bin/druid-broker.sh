#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/_common.rc

cd $DRUID_HOME
java  -server -Xms128m -Xmx1g \
      -Duser.timezone=UTC \
      -Dfile.encoding=UTF-8 \
      -Djava.io.tmpdir=$DIR/../var/tmp \
      -Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager \
      -cp 'conf/druid/_common:conf/druid/broker:lib/*' \
      io.druid.cli.Main server broker | tee $DIR/../logs/druid-broker.log
