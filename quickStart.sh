#!/usr/bin/env bash
# provide the params to quickstart hybris development
catalogRoot='/media/mikhail/fd1ad2f6-4a8c-4de6-9203-5d35f9cdea4a'
targetDirectory=${catalogRoot}'/h1'
hybrisCommerceSuitePath=${catalogRoot}'/installers/hybris/HYBRIS-6.3.zip'
repositoryFolder=${catalogRoot}'/epmespvelc'
repositoryBranch='develop'

platformDirectory=${targetDirectory}'/hybris/bin/platform'
currentFolder=${PWD}

# extract Hybris into target directory
echo extracting hybris commerce suite...
unzip -q ${hybrisCommerceSuitePath} -d ${targetDirectory}

# pull the required git branch and copy into Hybris folder
. ./_pullAndMerge.sh ${repositoryFolder} ${repositoryBranch} ${targetDirectory}

# copy all the helpfull files into extracted hybris commerce suite
cp -a platformScripts/. ${platformDirectory}/

# delete all the .bat files from hybris commerce suite platform folder
find ${platformDirectory}'/' -name '*.bat' -delete

. ./_projectSpeciffic.sh ${targetDirectory}

# run init option
cd ${platformDirectory}
. ./initAndStart.sh