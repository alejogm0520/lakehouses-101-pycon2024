#!/bin/bash
BASE_PATH="/home/PyCon2024/Project"

DATA_SUBDIR="$1"
if [ -z "${DATA_SUBDIR}" ]; then
    DATA_SUBDIR="data"
fi

PLATFORM="$2"
if [ -z "${PLATFORM}" ]; then
    PLATFORM="amd64"
fi

echo ""
echo "Data subdir: ${DATA_SUBDIR}"
echo "Source path: ${BASE_PATH}/${DATA_SUBDIR}"
echo "Platform: ${PLATFORM}"

echo ""
if [ ! -f "/usr/local/bin/mc" ]; then
    echo "Download MinIO Client..."
    echo ""
    curl -o /usr/local/bin/mc https://dl.min.io/client/mc/release/linux-${PLATFORM}/mc
    chmod +x /usr/local/bin/mc
    mc alias set minio http://minio:9000 ${MINIO_ACCESS_KEY} ${MINIO_SECRET_KEY}
else
    echo "mc already exists"
fi

# Check if the bucket already exists
echo ""
echo "Check if the bucket already exists..."
if ! mc ls minio/data-lakehouse
then
    # Create Bucket
    echo ""
    echo "Create Bucket"
    echo ""
    mc mb minio/data-lakehouse
    mc mb minio/data-lakehouse/Raw/
    mc mb minio/data-lakehouse/Bronze/
    mc mb minio/data-lakehouse/Silver/
    mc mb minio/data-lakehouse/Gold/
    echo ""
    echo "Set public policy"
    echo ""
    mc policy set public minio/data-lakehouse/Raw
    mc policy set public minio/data-lakehouse/Bronze
    mc policy set public minio/data-lakehouse/Silver
    mc policy set public minio/data-lakehouse/Gold
    echo ""
    echo "Bucket created"
else
    echo "Bucket already exists"
fi

# Upload Data
echo ""
echo "Uploading data from '"${BASE_PATH}/${DATA_SUBDIR}"' to 'minio/data-lakehouse/Raw'"
echo ""
mc cp -r "${BASE_PATH}/${DATA_SUBDIR}" minio/data-lakehouse/Raw/
