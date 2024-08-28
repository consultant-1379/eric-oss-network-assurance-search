#!/bin/bash

echo ">>>>  Waiting for OpenSearch to initialize before ingesting test data <<<<"
# use while loop to check if opensearch is running 
while true
do
    # netstat -uplnt | grep :9200 | grep LISTEN > /dev/null
    curl -k -XGET https://localhost:9200 -u 'admin:admin' &> /dev/null
    verifier=$?
    if [ 0 = $verifier ]
        then
            # OpenSearch is now running
            break
        else
            echo "OpenSearch is not running yet"
            sleep 5
    fi
done

# Sleeping for additional time just in case
loopCounter=1
loopLimit=7
sleepLength=5
totalSleepLength=$((loopLimit * sleepLength))
echo "OpenSearch is running, will now attempt to ingest data in ${totalSleepLength} seconds"
while [ $loopCounter -le $loopLimit ]
do
  sleep $sleepLength
  secondsSlept=$((loopCounter * sleepLength))
  secondsLeft=$((totalSleepLength - secondsSlept))
  echo "Ingesting mock data in ${secondsLeft} seconds..."
  ((loopCounter++))
done


# Adding Schema
echo "Adding schema to OpenSearch"
/usr/share/opensearch/sample-data/add_schema.sh

# Adding Data
echo "Adding sample data to OpenSearch"
for shellScript in /usr/share/opensearch/sample-data/initialization-files/*
do
  /bin/sh "$shellScript";
  echo "Executed ${shellScript} script.";
  sleep 1;
done

echo "Data ingestion complete."