#!/usr/bin/env bash

doHandShakeLocalextensions=true
doClean=true
doInvokeMain=false
doCodeQuality=true
doAntAll=true
doUnitTests=true
doIntegrationTests=true
doInitializeJunitTenant=true
doManualTests=true
doInitialization=true
hybrisSecurePort=9002

. ./fullChecks.sh ${doHandShakeLocalextensions} ${doClean} ${doInvokeMain} ${doCodeQuality} ${doAntAll} ${doUnitTests} ${doIntegrationTests} ${doInitializeJunitTenant} ${doManualTests} ${doInitialization} ${hybrisSecurePort}