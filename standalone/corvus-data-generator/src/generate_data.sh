#! /bin/sh
cd /home/src;

if [ $1 = "initialize" ]
then

  if [ "$ENABLE_SEARCH_ENGINE_DATA_GENERATION" = "true" ]
  then
    # Generating OpenSearch and PostgreSQL scripts
    /usr/local/bin/python ./corvus_data_generator.py --opensearch_init;

    echo ">>>>  Waiting for the ADP Search Engine to initialize before ingesting data <<<<";
    while true
    do
      curl -sS -k -XGET $SEARCH_ENGINE_URL;
      verifier=$?;
      if [ 0 = $verifier ]
      then
        # ADP Search Engine is ready to recieve requests
        break;
      else
        echo "ADP Search Engine is not ready yet";
        sleep 5;
      fi
    done
    echo "ADP Search Engine is ready to recieve requests. Data ingestion will begin.";

    echo ">>>>  Waiting for the Postgres database to initialize before ingesting data <<<<";
    while true
    do
      curl -sS -k -XGET $POSTGRES_READINESS_PROBE_URL;
      verifier=$?;
      if [ 0 = $verifier ]
      then
        # Postgres database is ready to receive requests
        break;
      else
        echo "Postgres database is not ready yet";
        sleep 5;
      fi
    done
    echo "Postgres database is ready to recieve requests. Data ingestion will begin.";

    # Running OpenSearch scripts
    for shellScript in ./generated-files/opensearch/*
    do
      /bin/sh "$shellScript" > /dev/null 2>&1;
      echo "Executed ${shellScript} script.";
    done

    # Running Postgres SQL files
    for sqlScript in ./generated-files/postgres/*
    do
      psql -U $POSTGRES_SUPER_USER -h "eric-data-document-database-pg.${K8S_NAMESPACE}.svc.cluster.local" -d $POSTGRES_DATABASE -a -f "$sqlScript" > /dev/null 2>&1;
      echo "Executed ${sqlScript} script.";
    done
  fi

  if [ "$ENABLE_VICTORIAMETRICS_DATA_GENERATION" = "true" ]
  then
    # Sending historical metric data to VictoriaMetrics
    /usr/local/bin/python ./corvus_data_generator.py --victoriametrics_init;
  fi

elif [ $1 = "generate" ]
then

  if [ "$ENABLE_SEARCH_ENGINE_DATA_GENERATION" = "true" ]
  then
    # Ingesting data into the ADP Search Engine and Postgres database twice
    max=2
    for i in `seq 0 $max`
    do
      # Generating OpenSearch and PostgreSQL scripts
      /usr/local/bin/python ./corvus_data_generator.py --opensearch;

      # Running OpenSearch scripts
      for shellScript in ./generated-files/opensearch/*
      do
        /bin/sh "$shellScript";
        echo "Executed ${shellScript} script.";
      done

      # Running Postgres SQL files
      for sqlScript in ./generated-files/postgres/*
      do
        psql -U $POSTGRES_SUPER_USER -h "eric-data-document-database-pg.${K8S_NAMESPACE}.svc.cluster.local" -d $POSTGRES_DATABASE -a -f "$sqlScript";
        echo "Executed ${sqlScript} script.";
      done
    done
  fi

  if [ "$ENABLE_VICTORIAMETRICS_DATA_GENERATION" = "true" ]
  then
    # Sending data to VictoriaMetrics
    /usr/local/bin/python ./corvus_data_generator.py --victoriametrics;
  fi

else
  echo "Invalid input argument.";
fi