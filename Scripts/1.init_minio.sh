#!/bin/bash
curl -o /usr/local/bin/mc https://dl.min.io/client/mc/release/linux-amd64/mc
chmod +x /usr/local/bin/mc
mc alias set minio http://minio:9000 ${MINIO_ACCESS_KEY} ${MINIO_SECRET_KEY}

# TODO: Check  if the bucket already exists
# Create Bucket
mc mb minio/data-lakehouse
mc mb minio/data-lakehouse/Raw/
mc mb minio/data-lakehouse/Bronze/
mc mb minio/data-lakehouse/Silver/
mc mb minio/data-lakehouse/Gold/



# Upload Data
mc cp -r ./data minio/data-lakehouse/Raw/
