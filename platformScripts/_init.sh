#!/usr/bin/env bash
initializeLogFileName=initializeLog.txt

ant initialize > ${initializeLogFileName}

. ./_edit.sh ${initializeLogFileName}