#!/usr/bin/env bash

. ./invokeMain.sh && ant clean all && . ./_init.sh && . ./codeQuality.sh
