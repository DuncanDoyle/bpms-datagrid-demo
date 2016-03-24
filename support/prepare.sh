#!/bin/sh
# Build the PostgreSQL module.

echo "\n----------------------------------------------------------------------------"
echo "Build JBoss EAP PostgreSQL module."
echo "----------------------------------------------------------------------------"

pushd create-postgresql-module-zip
./clean-postgresql-module-zip.sh
./build-postgresql-module-zip.sh
popd

echo "\n----------------------------------------------------------------------------"
echo "Build JBoss EAP JBoss DataGrid module."
echo "----------------------------------------------------------------------------"

# Build the JDG module.
pushd create-jdg-module-zip
./clean-jdg-module-zip.sh
./build-jdg-module-zip.sh
popd

echo "\n----------------------------------------------------------------------------"
echo "Build the Maven repository with WorkItemHandlers."
echo "----------------------------------------------------------------------------"

# Build the Maven repository.
pushd build-maven-wih-repository
./clean-wih-repository-zip.sh
./build-wih-repository-zip.sh
popd
