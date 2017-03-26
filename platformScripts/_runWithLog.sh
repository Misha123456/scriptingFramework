#!/usr/bin/env bash

commandToRun=$1
logFile=$2

if [ -z "$logFile" ]
  then
    sanitizedFileName=$(echo "${commandToRun}" | tr '/' '_')
    logFile="log_"${sanitizedFileName}".txt"
fi

echo "Logging of command \""${commandToRun}"\" ..."

${commandToRun} > "${logFile}"
. ./_edit.sh "${logFile}"