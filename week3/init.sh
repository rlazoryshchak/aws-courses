#!/bin/bash

aws s3 mb s3://rlazoryshchak-bucket

aws s3api put-bucket-versioning --bucket rlazoryshchak-bucket --versioning-configuration Status=Enabled

aws s3 cp rds-script.sql s3://rlazoryshchak-bucket/

aws s3 cp dynamodb-script.sh s3://rlazoryshchak-bucket/