#!/usr/bin/env bash
ant clean

./invokeMain.sh

ant all

./_runWithLog.sh "ant unittests"
./_runWithLog.sh "ant yunitinit integrationtests"
./_runWithLog.sh "./manualtests.sh"

#unitTestsLog=unittests.txt
#ant unittests > ${unitTestsLog}
#./_edit.sh ${unitTestsLog}
#
#integrationTestsLog=integrationTestsWithInit.txt
#ant yunitinit integrationtests > ${integrationTestsLog}
#./_edit.sh ${integrationTestsLog}
#
#manualTestsLog=manualTests.txt
#./manualtests.sh > ${manualTestsLog}
#./_edit.sh ${manualTestsLog}