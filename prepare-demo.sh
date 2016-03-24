#!/bin/sh
DEMO="BPMSuite and DataGrid integration demo."
AUTHORS="Red Hat"
AUTHORS2=""
PROJECT="git@github.com:DuncanDoyle/bpms-datagrid-demo.git"
PRODUCT="JBoss BPM Suite"
VERSION=6.2
JBOSS_HOME=./target/jboss-bpmsuite-$VERSION
SERVER_DIR=$JBOSS_HOME/standalone/deployments/
SERVER_CONF=$JBOSS_HOME/standalone/configuration/
SERVER_BIN=$JBOSS_HOME/bin
SRC_DIR=./installs
SUPPORT_DIR=./support
PRJ_DIR=./projects
BPMS=jboss-bpmsuite-6.2.0.GA-deployable-eap6.x.zip
EAP=jboss-eap-6.4.0.zip
EAP_PATCH=jboss-eap-6.4.4-patch.zip
JDG=jboss-datagrid-6.6.0-server.zip
JDG_CLIENT_MODULES=jboss-datagrid-6.6.0-eap-modules-remote-java-client.zip

# wipe screen.
clear

echo
echo "##################################################################"
echo "##                                                              ##"
echo "##  Setting up the ${DEMO}	##"
echo "##                                                              ##"
echo "##                                                              ##"
echo "##     ####  ####   #   #      ### #   # ##### ##### #####      ##"
echo "##     #   # #   # # # # #    #    #   #   #     #   #          ##"
echo "##     ####  ####  #  #  #     ##  #   #   #     #   ###        ##"
echo "##     #   # #     #     #       # #   #   #     #   #          ##"
echo "##     ####  #     #     #    ###  ##### #####   #   #####      ##"
echo "##                                                              ##"
echo "##                                                              ##"
echo "##  brought to you by,                                          ##"
echo "##                     ${AUTHORS}                                  ##"
echo "##                                                              ##"
echo "##                                                              ##"
echo "##  ${PROJECT}           ##"
echo "##                                                              ##"
echo "##################################################################"
echo


command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }

# make some checks first before proceeding.
if [ -r $SRC_DIR/$EAP ] || [ -L $SRC_DIR/$EAP ]; then
        echo Product sources are present...: $EAP
        echo
else
        echo Need to download $EAP package from the Customer Portal
        echo and place it in the $SRC_DIR directory to proceed...
        echo
        exit
fi

if [ -r $SRC_DIR/$EAP_PATCH ] || [ -L $SRC_DIR/$EAP_PATCH ]; then
        echo Product patches are present...: $EAP_PATCH
        echo
else
        echo Need to download $EAP_PATCH package from the Customer Portal
        echo and place it in the $SRC_DIR directory to proceed...
        echo
        exit
fi

if [ -r $SRC_DIR/$BPMS ] || [ -L $SRC_DIR/$BPMS ]; then
        echo Product sources are present...: $BPMS
        echo
else
        echo Need to download $BPMS package from the Customer Portal
        echo and place it in the $SRC_DIR directory to proceed...
        echo
        exit
fi

if [ -r $SRC_DIR/$JDG ] || [ -L $SRC_DIR/$JDG ]; then
        echo Product sources are present...: $JDG
        echo
else
        echo Need to download $JDG package from the Customer Portal
        echo and place it in the $SRC_DIR directory to proceed...
        echo
        exit
fi

if [ -r $SRC_DIR/$JDG_CLIENT_MODULES ] || [ -L $SRC_DIR/$JDG_CLIENT_MODULES ]; then
        echo Product sources are present...: $JDG_CLIENT_MODULES
        echo
else
        echo Need to download $JDG_CLIENT_MODULES package from the Customer Portal
        echo and place it in the $SRC_DIR directory to proceed...
        echo
        exit
fi


echo "Preparing demo resources."
pushd support
./prepare.sh
popd

echo
echo "========================================================================================="
echo "=                                                                                       ="
echo "=  You can now build the Docker images with:              				="
echo "=                                                                                       ="
echo "=  ./build-docker-images.sh                                                                    ="
echo "=                                                                                       ="
echo "=  You can now start the $PRODUCT with:              				="
echo "=                                                                                       ="
echo "=  ./start-docker-containers.sh                                                                    ="
echo "=                                                                                       ="
echo "=  Login into business central at:                                                      ="
echo "=                                                                                       ="
echo "=    http://{docker-machine-ip}:8080/business-central  (u:bpmsAdmin / p:jboss@01)       ="
echo "=                                                                                       ="
echo "=  See README.md for general details to run the various demo cases.                     ="
echo "=                                                                                       ="
echo "=  $PRODUCT $VERSION $DEMO Setup Complete.          ="
echo "=                                                                                       ="
echo "========================================================================================="

