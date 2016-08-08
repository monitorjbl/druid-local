#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/_common.rc

cd $DRUID_HOME
java  -server -Xms128m -Xmx256m \
      -Duser.timezone=UTC \
      -Dfile.encoding=UTF-8 \
      -Djava.io.tmpdir=$DIR/../var/tmp \
      -Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager \
      -cp "$DIR/../conf/druid/_common:$DIR/../conf/druid/overlord:lib/*" \
      io.druid.cli.Main server overlord | tee $DIR/../logs/druid-overlord.log
