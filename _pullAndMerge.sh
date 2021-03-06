#!/usr/bin/env bash
repositoryFolder=$1
repositoryBranch=$2
targetDirectory=$3

currentFolder=${PWD}


# pull the required git branch and copy into Hybris folder
cd ${repositoryFolder} &&
git reset --hard origin/${repositoryBranch} &&
git checkout ${repositoryBranch} &&
git pull &&
cp -Rf ${repositoryFolder}/. ${targetDirectory}/ &&
git reset --hard origin/${repositoryBranch} &&

cd ${currentFolder}