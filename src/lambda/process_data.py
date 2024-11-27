import json
import base64
import boto3
import time

s3_client = boto3.client('s3')

def lambda_handler(event, context):
    records = []
    for record in event['Records']:
        payload = record['kinesis']['data']
        data = json.loads(base64.b64decode(payload))
        print(f"Received data: {data}")
        records.append(data)

    # Save records to S3
    timestamp = int(time.time())
    file_name = f'data_{timestamp}.json'
    s3_client.put_object(
        Bucket='my-unique-bucket-1234567',
        Key=file_name,
        Body=json.dumps(records)
    )

    return {
        'statusCode': 200,
        'body': json.dumps('Successfully processed records and stored in S3')
    }
