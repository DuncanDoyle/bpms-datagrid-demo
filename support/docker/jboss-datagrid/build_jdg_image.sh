#!/bin/sh
#
# Builds the Docker container.
#
# author: ddoyle@redhat.com
#

# Clean existing dockerfile_copy dir
echo "Cleaning resources directory."
rm -rf dockerfile_copy/
# Copy the required resources from the support dir.
echo "Copying resources to Docker build context."
mkdir dockerfile_copy
cp ../../../installs/jboss-datagrid-6.6.0-server.zip dockerfile_copy/
cp -r ../../jboss-datagrid/* dockerfile_copy/

echo "Building the Docker image."
docker build --rm -t jbossdemocentral/bpms-jdg-integration-demo_jboss-datagrid-server:6.6.0 -f Dockerfile_jdg .

echo "Post-build clean-up."
rm -rf dockerfile_copy/

echo "Build finished successfully."
