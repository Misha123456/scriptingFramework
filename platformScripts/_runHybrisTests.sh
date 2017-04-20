#!/usr/bin/env bash

commandToRun=$1
logDir=$2
if [ -z "$logDir" ]
  then
    logDir="tests/"${commandToRun}
fi

echo "Running browser log command \""${commandToRun}"\" ..."

${commandToRun} "-DHYBRIS_LOG_DIR="${logDir}

. ./_openInBrowser.sh "${logDir}"/junit/index.html