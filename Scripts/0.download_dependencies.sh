#!/bin/bash
# TODO: Pass TempPackages path as an arg.

download_file () {
  # Taken from https://gist.github.com/alejogm0520/a7a7206e511084de3cba36e9133469c2
  URL=$1
  TARGET_FOLDER=$2
  if [ -z "${2}" ]
  then
        FILE_PATH=./${URL##*/}
  else
        FILE_PATH=${TARGET_FOLDER%%/}/${URL##*/}
  fi

  if [ -f "${FILE_PATH}" ]
  then
    echo "${FILE_PATH} is already downloaded."
  else
      wget -O "${FILE_PATH}" "${URL}"
  fi
}


echo "Spark"
download_file https://archive.apache.org/dist/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz ./TempPackages

echo "Hadoop AWS"
download_file https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.3/hadoop-aws-3.3.3.jar ./TempPackages

echo "AWS Java SDK jars"
# SDK
download_file https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk/1.11.1026/aws-java-sdk-1.11.1026.jar ./TempPackages

echo "Postgres Driver for Hive"
download_file https://jdbc.postgresql.org/download/postgresql-42.7.3.jar ./TempPackages

echo "Trino CLI"
download_file https://repo1.maven.org/maven2/io/trino/trino-cli/449/trino-cli-449-executable.jar ./TempPackages
