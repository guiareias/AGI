#!/bin/bash
echo "***********************************************************"
echo "Welcome to Calculator Service build and deploy scripting!"
echo "***********************************************************"

echo "*****************************************************"
echo "Starting Vuecalc service production build"
echo "*****************************************************"
cd vuecalc
sh build.sh
echo "*****************************************************"
echo "Starting Expressed service production build"
echo "*****************************************************"
cd ../expressed
sh build.sh
echo "*****************************************************"
echo "Starting Happy service production build"
echo "*****************************************************"
cd ../happy
sh build.sh
echo "*****************************************************"
echo "Starting Bootstorage service production build"
echo "*****************************************************"
cd ../bootstorage
sh build.sh

echo "*****************************************************"
echo "Docker deployment completed successfully!"
echo "*****************************************************"

