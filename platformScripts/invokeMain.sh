#!/bin/sh
currentFolder=${PWD};
scriptFolder=${currentFolder}"/../../../../../../../scripts";

cd ${scriptFolder};
. ./custom-local-setup-config.sh;
cd ${currentFolder};
