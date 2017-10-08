#!/usr/bin/env bash

hybrisLogDir=realpath "../../../../../../log"

commandToRun=$1
logDir=$2
if [ -z "$logDir" ]
  then
    logDir="tests/"${commandToRun}
fi

echo "Running browser log command \""${commandToRun}"\" ..."

targetLogDir="${hybrisLogDir}/${logDir}"

${commandToRun} "-DHYBRIS_LOG_DIR="${targetLogDir}

. ./_openInBrowser.sh "${targetLogDir}"/junit/index.html