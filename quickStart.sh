#!/usr/bin/env bash
# provide the params to quickstart hybris development
catalogRoot='/media/mikhail/fd1ad2f6-4a8c-4de6-9203-5d35f9cdea4a'
targetDirectory=${catalogRoot}'/m2'
hybrisCommerceSuitePath=${catalogRoot}'/installers/hybris/HYBRIS-6.4.0.3.zip'
repositoryBranch='develop'

currentFolder=${PWD}
scriptsFolder=${targetDirectory}'/hybris/bin/custom/buildscripts/resources/buildscripts/ant'
developProfileDirectory=${targetDirectory}'/configtemplates/develop'
repositoryFolder=${catalogRoot}'/velcom/epmespvelc'

# Steps to execute
doExtractHybris=false
doPullAndMerge=false
doCopyPlatformScripts=true
doRemoveBatFiles=true
doCopyProjectSpecificFiles=true
doReplaceLocalExtensionsFile=false
doInitAndStart=false

if ${doExtractHybris};
  then
# extract Hybris into target directory
echo extracting hybris commerce suite...
unzip -q ${hybrisCommerceSuitePath} -d ${targetDirectory}
fi

if ${doPullAndMerge};
  then
# pull the required git branch and copy into Hybris folder
. ./_pullAndMerge.sh ${repositoryFolder} ${repositoryBranch} ${targetDirectory}
fi

if ${doCopyPlatformScripts};
  then
# copy all the helpfull files into extracted hybris commerce suite
cp -a platformScripts/. ${scriptsFolder}/
fi

if ${doRemoveBatFiles};
  then
# delete all the .bat files from hybris commerce suite platform folder
find ${scriptsFolder}'/' -name '*.bat' -delete
fi

if ${doCopyProjectSpecificFiles};
  then
. ./_projectSpeciffic.sh ${targetDirectory}
fi

if ${doReplaceLocalExtensionsFile};
  then
# replace localextensions.xml (for 'develop' profile)
cp -f 'templates/projectSpeciffic/localextensions.xml' ${developProfileDirectory}
fi

if ${doInitAndStart};
  then
# run init option
cd ${scriptsFolder}
. ./initAndStart.sh
fi