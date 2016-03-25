JBoss BPMSuite & DataGrid Integration Demo
==========================================
This is a technical demo that shows the integration between Red Hat JBoss BPMSuite and Red Hat JBoss DataGrid.
The integration between these 2 products allows process designers and developers to reliably store and access high-volumes of in-memory data with high-speed and low-latency.

The demo provides a very simple, technical BPMN2 process that demonstrates storing data in, and retrieving data from a JBoss Data Grid cluster (the demo uses a single node, but this can be easily expanded to a multi-node grid). A 'key' has to be entered when the process starts. The first node tries to retrieve the 'value' from JDG. If the 'value' is not present, the process creates a HumanTask to enter a new 'value'. If the 'value' is present in the grid, the process creates a HumanTask that allows the user to change the 'value'. Finally, the new or updated value is stored in JDG.

The demo runs in 3 Docker containers and therefore requires the following software to be installed on your system:
* Docker
* docker-compose

Information on how to install Docker and docker-compose on various platforms can be found here: https://docs.docker.com/compose/install/

```
Note that this demo is developed to run on both Linux and Mac OS X. Scripts for Windows are currently not available, but will be added in the near future).
```

To build the demo:
1. Add the following files to the "installs" directory:
 - jboss-eap-6.4.0.zip: JBoss EAP 6.4.0 distribution
 - jboss-eap-6.4.4-patch.zip: JBoss EAP 6.4.4 Patch
 - jboss-bpmsuite-6.2.0.GA-deployable-eap6.x.zip: JBoss BPMSuite 6.2.0.GA deployables.
 - jboss-datagrid-6.6.0-server.zip: JBoss DataGrid Server 6.6.0 distribution
 - jboss-datagrid-6.6.0-eap-modules-remote-java-client.zip: JBoss DataGrid 6.6.0 Remote Client EAP modules
2. Run the "prepare-demo.sh" script, which will prepare things like the PostgreSQL EAP Modules, the JBoss DataGrid EAP Modules, the Infinspan/JDG WorkItemHandlers, etc.
3. Run the "build-docker-images.sh" script, which will build the PostgreSQL, JBoss DataGrid Server and JBoss BPMSuite Docker images.
4. Run "start-docker.sh" script to start the demo.

Running the demo:
1. Build & Deploy the project.
2. Start a new process instance. You will be asked to enter an _ispnKey_. This i§s the key that will be used to access JBoss DataGrid and store and/or retrieve data.
3. On the first run of the demo, the grid will not contain any value for the given _ispnKey_. A human-task will is created in which allows the user to enter a value for the given _ispnKey_.
4. Start the task, enter a value and complete the task.
4. After completion of the human-task, the process stores the entered value with the given _ispnKey_ into the grid.
5. Start a new process instance using the same _ispnKey_ as in the first process instance.
6. The process will retrieve the value for the given _ispnKey_ from the grid and create a human-task.
7. The value is displayed in the human-task. Start the task, change the value and complete the task.
8. After completion of the human-task, the new value is stored in the grid, overwriting the previous value.


Demonstrated Concepts
---------------------
The demo consists of 3 Docker containers:
* PostgreSQL: the BPMSuite database.
* JBoss DataGrid Server
* JBoss BPMSuite

Second, the demo utilizes a custom jBPM WorkItemHandler to eneable integration between JBoss BPMSuite and JBoss DataGrid. As such, this demo demonstrates, apart from the BPMSuit and JDG integration:
1. How to add additional JBoss EAP module-layers to the JBoss BPMSuite platform:
 - The demo installs both a PostgreSQL modules layer and a JBoss DataGrid Client modules layer to the JBoss BPMSuite platform at `/opt/jboss/jboss-eap-6.4/modules/system/layers` in the BPMSuite Docker container.
 - The PostgreSQL module allows connection to the PostgreSQL datasource.
 - The JBoss DataGrid Client module is used by the InfinispanWorkItemHandler to connect to the JBoss DataGrid from the BPMSuite business process.
2. How to configure and use an enterprise-class RDBMS (PostgreSQL) in combination with JBoss BPMSuite:
 - The demo shows how the BPMSuite platform's `bpms-standalone.xml` needs to be configured to connect to the PostgreSQL RDBMS.
 - The demo shows how the BPMSuite platform, in particular the `business-central` component, needs to be configured to use a PostgreSQL database.
3. How to make custom components (e.g. WorkItemHandlers) available to the BPMSuite platform without the need to manually upload them to the BPMSuite Maven repository:
 - The InfinispanWorkItemHandler is added to the Docker container in custom Maven repository at `/opt/jboss/wih-maven-repository` (along with a number of required dependencies).
 - The BPMSuite platform is configured to use a custom Maven configuration file at `/opt/jboss/settings.xml` which points to the WIH Maven repository. This allows the BPMSuite platform to resolve the InfinispanWorkItemHandler dependency configured on the demo project.

Supporting Articles
-------------------
- [Integrate JBoss BPMSuite with JBoss DataGrid](http://duncandoyle.blogspot.nl/2016/03/integrate-jboss-bpmsuite-with-jboss.html)

Released versions
-----------------
See the tagged releases for the following versions of the product:

- v1.0 - Initial version of the BPMS & JDG integration demo.

