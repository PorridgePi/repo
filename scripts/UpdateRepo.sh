#!/bin/bash

currentDir=$(pwd)
scriptDir=$(dirname "$0")

cd $currentDir
rm Packages*

cd $scriptDir
./dpkg-scanpackages -m $currentDir /dev/null > $currentDir/Packages

cd $currentDir
bzip2 Packages
