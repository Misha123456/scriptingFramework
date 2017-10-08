# This shell script just calls hybris setantenv.sh. It has been created for more convinient using of build.xml in custom module folder.
#!/bin/bash 

# We need remember previous location due to implementation of hybris setantenv.sh then uses line "export PLATFORM_HOME=`pwd`"
ORIGINAL_LOCATION=`pwd`
cd ../../../../../platform
. ./setantenv.sh
cd $ORIGINAL_LOCATION