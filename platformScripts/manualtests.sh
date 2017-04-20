#!/usr/bin/env bash
hybrisSecurePort=$1
skipInitialization=$2

terminalProfile=Default

if ! ${skipInitialization};
  then
    . ./_runWithLog.sh "ant initialize"
fi

if ! echo exit | nc localhost ${hybrisSecurePort};
  then
   gnome-terminal -e "./server.sh" --profile=${terminalProfile}
fi

. ./_manualtests.sh ${hybrisSecurePort}
