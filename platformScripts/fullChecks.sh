#!/usr/bin/env bash
ant clean

. ./invokeMain.sh

ant all

. ./_runWithLog.sh "ant unittests"
. ./_runWithLog.sh "ant yunitinit integrationtests"
. ./_runWithLog.sh ". ./manualtests.sh"