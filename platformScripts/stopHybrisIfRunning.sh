#!/usr/bin/env bash
hybrisSecurePort=$1

CURRENT_FOLDER=${PWD}
hybrisPlatformHome="../../../../../platform"

terminalProfile=Default

if [ -z "$hybrisSecurePort" ];
  then
    echo "use default hybris secure port (9002)"
    hybrisSecurePort=9002
fi

if echo exit | nc localhost ${hybrisSecurePort};
  then
    echo "stopping hybris server ..."
    cd ${hybrisPlatformHome}
    gnome-terminal -e "./hybrisserver.sh stop" --profile=${terminalProfile}
fi
cd ${CURRENT_FOLDER}
