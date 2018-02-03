#!/usr/bin/env bash
currentFolder=${PWD}
platformFolder=${currentFolder}"/../../../../../platform"
fullChecksBackUpFolder=${currentFolder}'/fullChecksBackUpFolder'
configFolder=${platformFolder}'/../../config'
localextensionsFile=${configFolder}'/localextensions.xml'
productionProfileLocalextensionsFile=${platformFolder}'/../../../configtemplates/production/localextensions.xml'

doHandShakeLocalextensions=$1
doClean=$2
doInvokeMain=$3
doCodeQuality=$4
doAntAll=$5
doUnitTests=$6
doIntegrationTests=$7
doInitializeJunitTenant=$8
doManualTests=$9
doInitialization=${10}
hybrisSecurePort=${11}

SECONDS=0;

if [ -z "$hybrisSecurePort" ];
  then
    echo "use default hybris secure port (9002)"
    hybrisSecurePort=9002
fi

. ./stopHybrisIfRunning.sh ${hybrisSecurePort}

if ${doHandShakeLocalextensions};
  then
    # backup and replace current localextensions.xml with fullChecks enough file
    mkdir ${fullChecksBackUpFolder}
    cp -f ${localextensionsFile} ${fullChecksBackUpFolder}'/'
    cp -f ${productionProfileLocalextensionsFile} ${configFolder}
fi

if ${doClean};
  then
    ant fastClean
fi

if ${doInvokeMain};
  then
    . ./invokeMain.sh
fi

if ${doCodeQuality};
  then
    . ./codeQuality.sh
fi

if ${doAntAll};
  then
    . ./_runWithLog.sh "ant fastAllWithCss"
fi

if ${doUnitTests};
  then
    . ./_runHybrisTests.sh "ant unittests" "tests/junit"
fi

if ${doIntegrationTests};
  then
    if ${doInitializeJunitTenant};
        then
        . ./_runWithLog.sh "ant yunitinit"
    fi
    . ./_runHybrisTests.sh "ant integrationtests" "tests/integration"
fi

if ${doManualTests};
  then
    . ./_runWithLog.sh ". ./manualtests.sh ${hybrisSecurePort} ${doInitialization}"
fi

if ${doHandShakeLocalextensions};
  then
    # replace fullChecks enough file with current localextensions.xml
    cp -f ${fullChecksBackUpFolder}'/localextensions.xml' ${configFolder}
fi

echo "Full checks finished in" $SECONDS "seconds"