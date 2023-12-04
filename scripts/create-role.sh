#!/bin/bash

# Check that the S3 bucket option has been passed in
# Needed to assign role to that bucket
if [ "$#" -ne 2 ]
then
  echo "Usage: $0 <s3_bucket>"
  exit 1
fi

S3_BUCKET=${1}

# Create role
aws iam create-role --role-name vmimport --assume-role-policy-document "file://trust-policy.json"

# Use role policy template file to create policy file for bucket
sed "s|disk-image-file-bucket|${S3_BUCKET}|g" | sed "s|export-bucket|${S3_BUCKET}|g" > /tmp/role-policy.json

# Add role policy
aws iam put-role-policy --role-name vmimport --policy-name vmimport --policy-document "file:///tmp/role-policy.json"

rm -f /tmp/role-policy.json
