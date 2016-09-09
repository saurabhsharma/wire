#!/bin/bash

echo "Wire!!"

#find . -maxdepth 1 -name "*.xcodeproj"
#find . -maxdepth 1 -name '*.xcodeproj' -o -name '*.xcworkspace'

projectfile=`find . -maxdepth 1 -name "*.xcodeproj" | cut -c3- | awk -F'.' '{print $1}'`

echo "$projectfile";

#echo ~/Desktop/"$projectfile/"

read -p "Enter export location (${HOME}/Desktop/$projectfile/):" exportlocation

  
if [[ -z "$exportlocation" ]]; then
   exportlocation=`echo ${HOME}/Desktop/$projectfile/`   
fi

mkdir -p "$exportlocation"


exit;


xcodebuild clean -project "$projectfile".xcodeproj -configuration Release -alltargets

xcodebuild archive -project "$projectfile".xcodeproj -scheme "$projectfile" -archivePath "$projectfile".xcarchive

xcodebuild -exportArchive -archivePath "$projectfile".xcarchive -exportPath "$projectfile" -exportFormat ipa

#xcodebuild -exportArchive -archivePath "$projectfile".xcarchive -exportPath "$projectfile" -exportFormat ipa -exportProvisioningProfile "$1"



exit;