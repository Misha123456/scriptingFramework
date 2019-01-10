#!/usr/bin/env bash

doInitJunit=$1

if [ "$doInitJunit" = "-u" ];
  then
    echo with yunitinit
fi

. ./invokeMain.sh;

. ./stopSolr.sh;

ant clean all && . ./_init.sh;

if [ "doInitJunit" = "-u" ];
  then
    ant yunitinit
fi

. ./server.sh;
