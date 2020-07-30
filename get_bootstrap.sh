#!/bin/sh

BOOTSTRAP_VERSION="4.3.1"

if [ ! -f "v${BOOTSTRAP_VERSION}.zip" ] 
then
	wget "https://github.com/twbs/bootstrap/archive/v${BOOTSTRAP_VERSION}.zip" 
fi 

if [ ! -f "bootstrap-${BOOTSTRAP_VERSION}" ]
then 
	unzip "v${BOOTSTRAP_VERSION}.zip"
fi 

if [ -d "web/static/bootstrap" ]
then
	rm -rf web/static/bootstrap
fi
mkdir "web/static/bootstrap"

#mv "bootstrap-${BOOTSTRAP_VERSION}/dist/*" web/static/bootstrap
#rm -rf "bootstrap-${BOOTSTRAP_VERSION}"
#rm "v${BOOTSTRAP_VERSION}.zip"



