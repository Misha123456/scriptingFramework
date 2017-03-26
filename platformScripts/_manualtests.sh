#!/usr/bin/env bash
port=$1

if [ -z "$1" ]
  then
    port=9002
fi

while ! echo exit | nc localhost ${port}; do sleep 1; done

manualLog=manualTests.txt

ant manualtests > ${manualLog}

./_edit.sh ${manualLog}

./hybrisserver.sh stop