To build the demo.
1) Add the following files to the "installs" directory:
- jboss-eap-6.4.0.zip
- jboss-eap-6.4.4-patch.zip
- jboss-bpmsuite-6.2.0.GA-deployable-eap6.x.zip
- jboss-datagrid-6.6.0-server.zip
2) Run the "prepare-demo.sh" script, which will prepare things like the PostgreSQL EAP Modules, the JBoss DataGrid EAP Modules, the Infinspan/JDG WorkItemHandlers, etc.
3) Run the "build-docker-images.sh" script, which will build the PostgreSQL, JBoss DataGrid Server and JBoss BPMSuite Docker images.
3) Run "start-docker.sh" script to start the demo.

