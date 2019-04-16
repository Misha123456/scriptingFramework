#!/usr/bin/env bash

. ./setantenv.sh
. ./invokeMain.sh
ant clean all
ant jacocoCoverage

. ./_openInBrowser.sh "../../../../../../log/junit/jacocoReport/index.html"
