#!/bin/bash

echo "Sample output" > sample-s3-file.txt

aws s3 mb s3://rlazoryshchak-bucket

aws s3api put-public-access-block --bucket rlazoryshchak-bucket --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

aws s3api put-bucket-versioning --bucket rlazoryshchak-bucket --versioning-configuration Status=Enabled

aws s3 cp sample-s3-file.txt s3://rlazoryshchak-bucket/

# Delete bucket
# aws s3 rb s3://rlazoryshchak-bucket/ --force
