# IoT Sensor Data Pipeline

A real-time data analytics pipeline using Amazon Web Services (AWS). This tutorial provides detailed, step-by-step instructions to help you set up each component of the pipeline, understand how they interact, and test the entire system.

## Pipeline Features
- Ingests real-time data
- Processes the data in real-time
- Stores the processed data for further analysis
- Visualizes the data using interactive dashboards

## Architecture Overview
Components:
- Data Producer: Simulates real-time data generation (e.g., IoT sensor data)
- Amazon Kinesis Data Streams: Captures and streams the data in real-time
- AWS Lambda: Processes the data in real-time
- Amazon S3: Stores the processed data
- Amazon QuickSight: Visualizes the data through interactive dashboards

## Prerequisites
- AWS Account: Sign up for a free AWS account
- AWS CLI Installed: Install the AWS Command Line Interface
- Python 3.x installed
- Basic Knowledge of Python

## Setup Instructions

1. Install AWS CLI
2. Configure AWS CLI with your AWS credentials

Enter your AWS Access Key ID, Secret Access Key, region (e.g., us-east-1), and output format (json)

3. Create Kinesis Data Stream
- Navigate to Kinesis in AWS Console
- Create data stream named "RealTimeDataStream" with 1 shard
![image](https://github.com/user-attachments/assets/759d5bff-6515-4914-9740-12ed56c06790)


4. Install Required Python Packages
- Navigate to the project directory
- Install the required packages using pip:
```
pip install -r requirements.txt
```

5. Run the Data Producer

6. Set up Lambda Function
- Create IAM role with AWSLambdaKinesisExecutionRole and AmazonS3FullAccess
- Create Lambda function named "ProcessKinesisData"
- Add Kinesis trigger with batch size 100
- Deploy the Lambda code from src/lambda/process_data.py
![image](https://github.com/user-attachments/assets/9c4e5040-6511-4b4f-9e2a-be2ff283afe2)





7. Configure QuickSight
- Sign up for QuickSight Standard Edition
- Create dataset using the manifest.json provided
- Create visualizations for temperature data

## Testing
1. Verify End-to-End Data Flow:
   - Ensure data_producer.py is running
   - Check CloudWatch logs for Lambda processing
   - Verify new files in S3 bucket
   - Refresh QuickSight dashboard
![image](https://github.com/user-attachments/assets/b730be01-3288-4d7b-ab7f-8b88cce3c7ba)


2. Test Different Scenarios:
   - Increase data volume (modify sleep time)
   - Run multiple producer instances
   - Test error handling

## Cleanup
To remove all AWS resources:
1. Delete Lambda Function
2. Delete Kinesis Data Stream
3. Empty and delete S3 Bucket
4. Delete QuickSight Account (Optional)
5. Delete IAM Roles and Policies

## Additional Resources
- [Amazon Kinesis Data Streams Developer Guide](https://docs.aws.amazon.com/streams/latest/dev/introduction.html)
- [AWS Lambda Developer Guide](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
- [Amazon S3 User Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html)
- [Amazon QuickSight User Guide](https://docs.aws.amazon.com/quicksight/latest/user/welcome.html)

## Next Steps
- Deep Dive into Services: Explore advanced features of Kinesis and Lambda
- Implement CI/CD Pipelines: Automate deployment using AWS CodePipeline
- Security Enhancements: Use AWS Secrets Manager for managing secrets
- Cost Optimization: Monitor and optimize costs using AWS Cost Explorer

## Security Best Practices
1. S3 Bucket:
   - Enable Versioning
   - Enable Server Access Logging
   - Apply Least Privilege Access
   - Enable Encryption (SSE-S3 or SSE-KMS)

2. Kinesis Stream:
   - Use IAM Policies with least privilege
   - Enable server-side encryption using AWS KMS

3. Monitoring:
   - Enable CloudTrail
   - Set up CloudWatch Alarms

## Support
For questions or assistance:
- AWS Forums
- Stack Overflow AWS Tag
