#!/bin/sh
currentFolder=${PWD};
scriptFolder=${currentFolder}"/../../../../../../../scripts";

cd ${scriptFolder};
ant createConfig -Dtemplate=develop_ui -Denv=local -Dtype=custom
ant customize
cd ${currentFolder};
