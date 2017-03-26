#!/usr/bin/env bash

commandToRun=$1
logFile=$2

if [ -z "$logFile" ]
  then
    logFile=${commandToRun}'.txt'
fi

${commandToRun} > ${logFile}
./_edit.sh ${logFile}