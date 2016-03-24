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
cp ../../../installs/jboss-eap-6.4.0.zip dockerfile_copy/
cp ../../../installs/jboss-eap-6.4.4-patch.zip dockerfile_copy/
cp ../../../installs/jboss-bpmsuite-6.2.0.GA-deployable-eap6.x.zip dockerfile_copy/
cp -r ../../jboss-bpmsuite/* dockerfile_copy/
cp ../../create-jdg-module-zip/target/jboss-datagrid-6.6.0-eap-modules-remote-java-client-module.zip dockerfile_copy/
cp ../../create-postgresql-module-zip/target/postgresql-module.zip dockerfile_copy/
cp ../../build-maven-wih-repository/target/wih-repository.zip dockerfile_copy/
cp -r ../../bpms-demo-niogit dockerfile_copy/bpms-demo-niogit

echo "Building Docker image."
docker build --rm -t jbossdemocentral/bpms-jdg-integration-demo_jboss-bpmsuite:6.2.0 -f Dockerfile_bpms .

echo "Build finished successfully."
