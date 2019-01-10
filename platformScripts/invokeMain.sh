#!/bin/sh
currentFolder=${PWD};
scriptFolder=${currentFolder}"/../../../../../../../scripts";

cd ${scriptFolder};
ant createConfig -Dtemplate=develop -Denv=local -Dtype=custom
ant customize
cd ${currentFolder};
