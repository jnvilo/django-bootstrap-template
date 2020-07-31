#!/bin/sh

BOOTSTRAP_VERSION="4.3.1"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
WEBDIR="$(dirname $DIR)"
echo "Entering $WEBDIR"
cd $WEBDIR
if [ ! -f "v${BOOTSTRAP_VERSION}.zip" ] 
then
	wget "https://github.com/twbs/bootstrap/archive/v${BOOTSTRAP_VERSION}.zip" 
else
	echo "v${BOOTSTRAP_VERSION}.zip was found present. Skipping download" 
fi 

if [ ! -d "bootstrap-${BOOTSTRAP_VERSION}" ]
then 
	echo "Bootstrap source dir not found. Expanding"
	unzip "v${BOOTSTRAP_VERSION}.zip"
else
	echo "Bootstrap was already found. No need to unzip" 
fi 

if [ -d "web/static/bootstrap" ]
then
	rm -rf web/static/bootstrap
fi

echo "Running: mkdir -p web/bootstrap/static/bootstrap"
mkdir -p web/bootstrap/static/bootstrap
echo "Running: cp -r bootstrap-${BOOTSTRAP_VERSION}/dist/css web/bootstrap/static/bootstrap/"
cp -r "bootstrap-${BOOTSTRAP_VERSION}/dist/css" web/bootstrap/static/bootstrap/
echo "Running: cp -r bootstrap-${BOOTSTRAP_VERSION}/dist/js web/bootstrap/static/bootstrap/"
cp -r "bootstrap-${BOOTSTRAP_VERSION}/dist/js" web/bootstrap/static/bootstrap/
echo "Running: mkdir -p web/bootstrap/static/bootstrap/assets/img"
mkdir -p web/bootstrap/static/bootstrap/assets/img 
echo "Running: cp -r bootstrap-${BOOTSTRAP_VERSION}/site/docs/4.3/assets/img/favicons  web/bootstrap/static/bootstrap/assets/img"
cp -r "bootstrap-${BOOTSTRAP_VERSION}/site/docs/4.3/assets/img/favicons"  web/bootstrap/static/bootstrap/assets/img
echo "Bootstrap Setup Completed"
