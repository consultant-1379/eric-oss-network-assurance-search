# You must have valid SELI_ARTIFACTORY_REPO_USER and SELI_ARTIFACTORY_REPO_PASS environment variables set before running this script.

# Constants
server=https://arm.seli.gic.ericsson.se/artifactory
repo=proj-eric-oss-dev-local
subrepo=com/ericsson/oss/air
localSubRepo=com.ericsson.oss.air
project=eric-oss-assurance-indexer

# Deleting stub.jar file if one exists
rm -f ./*-stubs.jar

# Fetching stub URL
path=$server/$repo/$subrepo/$project
version=$(curl -s -u "$SELI_ARTIFACTORY_REPO_USER:$SELI_ARTIFACTORY_REPO_PASS" $path/maven-metadata.xml | grep latest | sed "s/.*<latest>\([^<]*\)<\/latest>.*/\1/")
build=$(curl -s -u "$SELI_ARTIFACTORY_REPO_USER:$SELI_ARTIFACTORY_REPO_PASS" $path/$version/maven-metadata.xml | grep '<value>' | head -1 | sed "s/.*<value>\([^<]*\)<\/value>.*/\1/")
jar=$project-$build-stubs.jar
url=$path/$version/$jar

# Downloading stub.jar file
wget --user $SELI_ARTIFACTORY_REPO_USER --password $SELI_ARTIFACTORY_REPO_PASS -q -N $url

# Extracting the .jar file
jar xf $jar

# Moving mapping files
cp -R ./META-INF/$localSubRepo/$project/$version/mappings/v1/* ./mappings/v1/

# Moving contract files
cp -R ./META-INF/$localSubRepo/$project/$version/contracts/v1/* ./__files/contracts/v1/

# Cleaning Up
rm -rf ./META-INF