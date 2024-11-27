#!/bin/bash
# From Step 8 (lines 447-463) of project.md

# Delete Lambda function
aws lambda delete-function --function-name ProcessKinesisData

# Delete Kinesis stream
aws kinesis delete-stream --stream-name RealTimeDataStream

# Empty and delete S3 bucket
aws s3 rm s3://my-unique-bucket-1234567 --recursive
aws s3 rb s3://my-unique-bucket-1234567

# Delete IAM role
aws iam delete-role --role-name LambdaKinesisRole

echo "Cleanup complete!"
