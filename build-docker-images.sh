#!/bin/sh
echo "\n----------------------------------------------------------------------------"
echo "Build PostgreSQL Docker images."
echo "----------------------------------------------------------------------------"
pushd support/docker/postgresql/
./build_postgresql_image.sh
popd


echo "\n----------------------------------------------------------------------------"
echo "Build JBoss DataGrid Server Docker images."
echo "----------------------------------------------------------------------------"
pushd support/docker/jboss-datagrid
./build_jdg_image.sh
popd

echo "\n----------------------------------------------------------------------------"
echo "Build the JBoss BPMSuite Docker images."
echo "----------------------------------------------------------------------------"
pushd support/docker/jboss-bpmsuite
./build_bpms_image.sh
popd


