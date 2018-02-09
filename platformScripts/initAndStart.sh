#!/usr/bin/env bash
. ./invokeMain.sh;

. ./stopSolr.sh;

ant fastClean fastAllWithResources && . ./_init.sh && . ./server.sh;
