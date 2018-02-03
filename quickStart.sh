#!/usr/bin/env bash
# provide the params to quickstart hybris development
catalogRoot='/media/mikhail/30eaaffa-a22e-45b0-9345-8ac6247f9240'
targetDirectory=${catalogRoot}'/m2'
pathToHybrisCommerceSuiteArchive=${catalogRoot}'/installers/hybris/HYBRIS-6.4.0.3.zip'
targetBranch='develop'

currentFolder=${PWD}
scriptsFolder=${targetDirectory}'/hybris/bin/custom/buildscripts/resources/buildscripts/ant'
developProfileDirectory=${targetDirectory}'/configtemplates/develop'
repositoryFolder=${catalogRoot}'/velcom/hyb-velcom'

# Steps to execute
doExtractHybris=true
doPullAndMerge=true
doCopyPlatformScripts=true
doRemoveBatFiles=true
doCopyProjectSpecificFiles=true
doReplaceLocalExtensionsFile=true
doInitialBuild=true
doInitAndStart=true

if ${doExtractHybris};
  then
# extract Hybris into target directory
echo extracting hybris commerce suite...
unzip -q ${pathToHybrisCommerceSuiteArchive} -d ${targetDirectory}
fi

if ${doPullAndMerge};
  then
# pull the required git branch and copy into Hybris folder
echo pull and merge the branch into extracted hybris...
. ./_pullAndMerge.sh ${repositoryFolder} ${targetBranch} ${targetDirectory}
fi

if ${doCopyPlatformScripts};
  then
# copy all the helpfull files into extracted hybris commerce suite
echo copying helpfull scripts into working directory ...
cp -a platformScripts/. ${scriptsFolder}/
fi

if ${doRemoveBatFiles};
  then
# delete all the .bat files from hybris commerce suite platform folder
echo removing redundant bat files ...
find ${scriptsFolder}'/' -name '*.bat' -delete
fi

if ${doCopyProjectSpecificFiles};
  then
echo copying project specific files ...
. ./_projectSpeciffic.sh ${targetDirectory}
fi

if ${doReplaceLocalExtensionsFile};
  then
# replace localextensions.xml (for 'develop' profile)
echo replacing localextensions file ...
cp -f 'templates/projectSpeciffic/localextensions.xml' ${developProfileDirectory}
fi

if ${doInitialBuild};
  then
# run init option
echo make initial build ...
cd ${scriptsFolder}
. ./setantenv.sh
. ./invokeMain.sh &&
ant clean all
fi

if ${doInitAndStart};
  then
# run init option
cd ${scriptsFolder}
. ./setantenv.sh
. ./initAndStart.sh
fi

cd ${currentFolder}