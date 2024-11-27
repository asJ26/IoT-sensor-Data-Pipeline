#!/bin/bash
# Based on Section 1 of project.md

# Install AWS CLI if not installed
if ! command -v aws &> /dev/null; then
    echo "Installing AWS CLI..."
    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    sudo installer -pkg AWSCLIV2.pkg -target /
fi

# Create Kinesis stream
aws kinesis create-stream \
    --stream-name RealTimeDataStream \
    --shard-count 1

# Create S3 bucket
aws s3 mb s3://my-unique-bucket-1234567

# Create IAM role and policies
aws iam create-role \
    --role-name LambdaKinesisRole \
    --assume-role-policy-document file://infrastructure/iam/lambda_role.json

echo "Setup complete! Please configure AWS CLI with 'aws configure'"
