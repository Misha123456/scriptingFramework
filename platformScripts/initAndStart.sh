#!/usr/bin/env bash
. ./invokeMain.sh;

. ./stopSolr.sh;

ant clean all && . ./_init.sh && . ./server.sh;
