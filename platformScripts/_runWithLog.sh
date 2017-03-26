#!/usr/bin/env bash

commandToRun=$1
logFile=$2
sanitizedFileName=aa

if [ -z "$logFile" ]
  then
    sanitizedFileName=$(echo "${commandToRun}" | tr '/' '_')
    echo ${sanitizedFileName}
    logFile="log_"${sanitizedFileName}".txt"
fi

${commandToRun} > "${logFile}"
. ./_edit.sh "${logFile}"