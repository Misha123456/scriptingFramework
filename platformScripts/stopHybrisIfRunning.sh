#!/usr/bin/env bash
hybrisSecurePort=$1

terminalProfile=Default

if [ -z "$hybrisSecurePort" ];
  then
    echo "use default hybris secure port (9002)"
    hybrisSecurePort=9002
fi

if echo exit | nc localhost ${hybrisSecurePort};
  then
    echo "stopping hybris server ..."
    gnome-terminal -e "./hybrisserver.sh stop" --profile=${terminalProfile}
fi