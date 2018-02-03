#!/usr/bin/env bash
currentFolder=${PWD}
platformFolder=${currentFolder}"/../../../../../platform"
checkstyleLogFolder=${currentFolder}'/../../../../../../log/checkstyle'
checkstyleBackUpFolder=${currentFolder}'/checkstyleBackUpFolder'
configFolder=${platformFolder}'/../../config'
localextensionsFile=${configFolder}'/localextensions.xml'
productionProfileLocalextensionsFile=${platformFolder}'/../../../configtemplates/production/localextensions.xml'

mkdir ${checkstyleBackUpFolder}

# backup and replace current localextensions.xml with checkstyle enought file
cp -f ${localextensionsFile} ${checkstyleBackUpFolder}'/'
cp -f ${productionProfileLocalextensionsFile} ${configFolder}

. ./setantenv.sh

ant checkstyle

# parse the files and write error lines only into another file and open it with sublime1

nautilus ${checkstyleLogFolder}

# replace checkstyle enought file with current localextensions.xml
cp -f ${checkstyleBackUpFolder}'/localextensions.xml' ${configFolder}

cd ${currentFolder}