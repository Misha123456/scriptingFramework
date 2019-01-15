#!/usr/bin/env bash
# env params
catalogRoot='/mnt/b72c5a51-4de0-4cd2-800b-a9e788068220'
currentFolder=${PWD}

# provide the params to quickstart hybris development
targetBranch=${1}
if [ -z "$targetBranch" ];
  then
    targetBranch=develop
fi

targetSubDirectory=${2}
if [ -z "$targetSubDirectory" ];
  then
    targetSubDirectory='/m1'
fi
targetDirectory=${catalogRoot}${targetSubDirectory}
echo ${targetBranch}
echo ${targetDirectory}


developProfileDirectory=${targetDirectory}'/configtemplates/develop'
scriptsFolder=${targetDirectory}'/hybris/bin/custom/buildscripts/resources/buildscripts/ant'
repositoryFolder=${catalogRoot}'/epmespvelc'
pathToHybrisCommerceSuiteArchive='/installers/hybris/HYBRIS-6.4.0.3.zip'


# Steps to execute
doExtractHybris=true
doPullAndMerge=true
doCopyPlatformScripts=true
doRemoveBatFiles=true
doCopyProjectSpecificFiles=true
doReplaceLocalExtensionsFile=false
doInitialBuild=false
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
