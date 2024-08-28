####################################################################################
# Script to automatically change CBO to new version in UI  (UI using common base OS/SUSE version)
####################################################################################
#!/bin/bash
echo "Querying for the latest CBO version..."
 latest_cbo_version=$(curl -u amadm100:AKCp5bBhBeBH1StEyF5jb1ZCrhWWJ97jkUCGFpcZvbnAqVSVAzH5RkzKCJi7dVdYJxjNDoCq9 \
    -X POST https://arm.epk.ericsson.se/artifactory/api/search/aql \
    -H "content-type: text/plain" \
    -d 'items.find({ "repo": {"$eq":"proj-ldc-docker-global"}, "path": {"$match" : "proj-ldc/common_base_os_release/sles/*-*"}}).sort({"$desc": ["created"]}).limit(1)' \
    2>/dev/null | grep path | sed -e 's_.*\/\(.*\)".*_\1_')
  if [ ! -z "${latest_cbo_version}" ]; then
    echo "Latest CBO version : $latest_cbo_version"
  else
    latest_cbo_version=6.7.0-9 # Hard coded until the latest is pullable again.
    echo "Using hard-coded CBO version : $latest_cbo_version"
  fi
echo "Update the Dockerfile with new CBO(SUSE)-$latest_cbo_version"
sed -i 's/SUSE_IMAGE_VERSION/'"$latest_cbo_version"'/' ./docker/Dockerfile
echo "Update the common-properties.yaml with Release CBO(SUSE)-$latest_cbo_version"
sed -i 's/SUSE_IMAGE_VERSION/'"$latest_cbo_version"'/' ./common-properties.yaml
SUSE_IMAGE_RELEASE=`echo $latest_cbo_version | sed 's/[-].*//'`
echo "Update the product-structure with Release CBO(SUSE)-$SUSE_IMAGE_RELEASE"
sed -i 's/SUSE_IMAGE_VERSION/'"$SUSE_IMAGE_RELEASE"'/' ./plms/product_structure.yaml
echo "END of shell"
exit

