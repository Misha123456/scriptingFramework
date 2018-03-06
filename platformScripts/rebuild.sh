#!/usr/bin/env bash

doClean=$1

if [ "$doClean" = "-c" ];
  then
    echo "clean before build"
    ant fastClean
fi
ant fastAll && . ./server.sh