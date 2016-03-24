#!/bin/sh
# Source function library.
if [ -f /etc/init.d/functions ]
then
        . /etc/init.d/functions
fi

################################################ Parse input parameters #############################################
function usage {
      echo "Usage: build-repository.sh [args...]"
      echo "where args include:"
      echo "    -p              Maven POM file that defines the resources of the module."
      echo "    -r              Output repository path."
      echo "    -h              Display help information."
}

#Parse the params
while getopts ":p:r:h" opt; do
  case $opt in
    p)
      POM_FILE=$OPTARG
      ;;
    r)
      OUTPUT_REPO_PATH=$OPTARG
      ;;
    h)
      usage
      exit 0
      ;;
\?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

PARAMS_NOT_OK=false

#Check params
if [ -z "$POM_FILE" ]
then
        echo "No Maven POM file specified!"
        PARAMS_NOT_OK=true
fi

if [ -z "$OUTPUT_REPO_PATH" ]
then
        echo "No output repository path specified!"
        PARAMS_NOT_OK=true
fi

if $PARAMS_NOT_OK
then
        usage
        exit 1
fi
#TODO: The dependency-plugin doesn't copy the SHA1 of the artifacts.
mvn -f $POM_FILE clean dependency:copy-dependencies -DexcludeTransitive -DoutputDirectory="$OUTPUT_REPO_PATH" -Dmdep.useRepositoryLayout=true -Dmdep.copyPom=true -Dmdep.addParentPoms=true
