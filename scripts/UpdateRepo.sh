#!/bin/bash

currentDir=$(pwd)
scriptDir=$(dirname "$0")

cd $currentDir
rm Packages*

cd $scriptDir
./dpkg-scanpackages -m $currentDir /dev/null > $currentDir/Packages

cd $currentDir

workingDir="$currentDir/"

echo $workingDir
cat Packages

sed -i -e "s@$workingDir@@" Packages

bzip2 Packages
