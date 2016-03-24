#!/bin/sh
unzip -d target/ ../../installs/jboss-datagrid-6.6.0-eap-modules-remote-java-client.zip
pushd target/jboss-datagrid-6.6.0-eap-modules-remote-java-client/modules
zip -r ../../jboss-datagrid-6.6.0-eap-modules-remote-java-client-module.zip *
popd
 
