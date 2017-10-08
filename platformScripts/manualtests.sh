#!/usr/bin/env bash
hybrisSecurePort=$1
skipInitialization=$2

CURRENT_FOLDER=${PWD}
hybrisPlatformHome="../../../../../platform"
terminalProfile=Default

if ${skipInitialization};
  then
    . ./_runWithLog.sh "ant initialize"
fi

if ! echo exit | nc localhost ${hybrisSecurePort};
  then
cd ${hybrisPlatformHome}
   gnome-terminal -e "./hybrisserver.sh" --profile=${terminalProfile}
fi
   cd ${CURRENT_FOLDER}

. ./_manualtests.sh ${hybrisSecurePort}

cd ${CURRENT_FOLDER}