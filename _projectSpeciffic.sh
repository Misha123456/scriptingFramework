#!/usr/bin/env bash
targetDirectory=$1
platformDirectory=${targetDirectory}'/hybris/bin/platform'

customPropertiesDirectory=${targetDirectory}'/envprops/local'
dbDriverDirectory=${platformDirectory}'/lib/dbdriver'
developProfileDirectory=${targetDirectory}'/configtemplates/develop'

# copy custom.local.properties file
cp -f 'templates/projectSpeciffic/custom.local.properties' ${customPropertiesDirectory}

# copy db driver into appropriate folder
cp -f 'templates/projectSpeciffic/mysql-connector-java-5.1.40-bin.jar' ${dbDriverDirectory}

# (optional) replace localextensions.xml (for 'develop' profile)
cp -f 'templates/projectSpeciffic/localextensions.xml' ${developProfileDirectory}