#!/usr/bin/env bash
currentFolder=${PWD}
platformFolder=${currentFolder}
fullChecksDirectory=${platformFolder}'/../custom/buildscripts/resources/buildscripts/ant'
fullChecksBackUpFolder=${fullChecksDirectory}'/fullChecksBackUpFolder'
configFolder=${platformFolder}'/../../config'
localextensionsFile=${configFolder}'/localextensions.xml'
productionProfileLocalextensionsFile=${platformFolder}'/../../../configtemplates/production/localextensions.xml'

# backup and replace current localextensions.xml with fullChecks enough file
cp -f ${localextensionsFile} ${fullChecksBackUpFolder}'/'
cp -f ${productionProfileLocalextensionsFile} ${configFolder}


ant clean

. ./invokeMain.sh

. ./codeQuality.sh

ant all

. ./_runHybrisTests.sh "ant unittests" "tests/junit"
. ./_runWithLog.sh "ant yunitinit" && . ./_runHybrisTests.sh "ant integrationtests" "tests/integration"
. ./_runWithLog.sh ". ./manualtests.sh"

# replace fullChecks enough file with current localextensions.xml
cp -f ${fullChecksBackUpFolder}'/localextensions.xml' ${configFolder}