#!/bin/sh
./build-jboss-module.sh -f pom.xml  -p "org/postgresql" -n "org.postgresql" -d "javax.api,javax.transaction.api" -o target/postgresql-module.zip

