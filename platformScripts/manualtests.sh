#!/usr/bin/env bash
hybrisSecurePort=$1

terminalProfile=Default

gnome-terminal -e ". ./server.sh" --profile=${terminalProfile} && . ./_manualtests.sh ${hybrisSecurePort}
