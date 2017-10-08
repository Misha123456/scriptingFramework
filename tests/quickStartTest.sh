#!/usr/bin/env bash

CURRENT_FOLDER=${PWD}
testedScriptDirectory="../"

catalogRoot='/media/mikhail/fd1ad2f6-4a8c-4de6-9203-5d35f9cdea4a'
targetDirectory=${catalogRoot}'/m2'

cd ${testedScriptDirectory}
. ./quickStart.sh

# emulate transaction for testing
#rm -rf ${targetDirectory}

cd ${CURRENT_FOLDER}