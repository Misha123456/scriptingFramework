#!/usr/bin/env bash
./invokeMain.sh;

./stopSolr.sh;

ant clean;

./_init.sh;

./server.sh;
