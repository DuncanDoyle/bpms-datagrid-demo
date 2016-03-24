#!/bin/sh
echo "\n----------------------------------------------------------------------------"
echo "Cloning the WIH repository."
echo "----------------------------------------------------------------------------"
mkdir -p target
pushd target
git clone https://github.com/DuncanDoyle/jbpm-workitems.git

echo "\n----------------------------------------------------------------------------"
echo "Building the WorkItemHandlers."
echo "----------------------------------------------------------------------------"
pushd jbpm-workitems
git checkout tags/1.0.0
mvn clean install
popd

popd

echo "\n----------------------------------------------------------------------------"
echo "Building the WorkItemHandlers Maven repository."
echo "----------------------------------------------------------------------------"
./build-repository.sh -p pom.xml -r target/wih-repository
pushd target/
zip -r wih-repository.zip wih-repository/*
popd
