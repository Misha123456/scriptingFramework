#!/usr/bin/env bash
. ./invokeMain.sh;

. ./stopSolr.sh;

ant fastClean fastAllWithCss && . ./_init.sh && . ./server.sh;
