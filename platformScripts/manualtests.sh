#!/usr/bin/env bash
hybrisSecurePort=$1

gnome-terminal -e "./server.sh" --profile=Default && ./_manualtests.sh ${hybrisSecurePort}
