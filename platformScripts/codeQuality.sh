#!/usr/bin/env bash
currentFolder=${PWD}
platformFolder=${currentFolder}
checkstyleLogFolder=${currentFolder}'/../../log/checkstyle'
checkStyleDirectory=${platformFolder}'/../custom/buildscripts/resources/buildscripts/ant'
checkstyleBackUpFolder=${checkStyleDirectory}'/checkstyleBackUpFolder'
configFolder=${platformFolder}'/../../config'
localextensionsFile=${configFolder}'/localextensions.xml'
productionProfileLocalextensionsFile=${platformFolder}'/../../../configtemplates/production/localextensions.xml'

mkdir ${checkstyleBackUpFolder}

cd ${checkStyleDirectory}

# backup and replace current localextensions.xml with checkstyle enought file
cp -f ${localextensionsFile} ${checkstyleBackUpFolder}'/'
cp -f ${productionProfileLocalextensionsFile} ${configFolder}

. . ./setantenv.sh

ant checkstyle

# parse the files and write error lines only into another file and open it with sublime1

nautilus ${checkstyleLogFolder}

# replace checkstyle enought file with current localextensions.xml
cp -f ${checkstyleBackUpFolder}'/localextensions.xml' ${configFolder}

cd ${currentFolder}