#!/bin/bash

currentDir=$(pwd)
scriptDir=$(dirname "$0")

cd $currentDir
rm Packages*

cd $scriptDir
./dpkg-scanpackages -m $currentDir /dev/null > $currentDir/Packages

cd $currentDir

workingDir="$(pwd)/" && gsed -i -e "s@$workingDir@@" Packages

bzip2 Packages
