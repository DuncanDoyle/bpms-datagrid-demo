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
cp ../../postgresql/* dockerfile_copy/

echo "Building Docker image."
docker build --rm -t jbossdemocentral/bpms-jdg-integration-demo_postgresql:9.3 -f Dockerfile_postgresql .

echo "Post-build clean-up."
rm -rf dockerfile_copy/

echo "Build finished successfully."

