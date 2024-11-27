import boto3
import random
import time
import json

# Create a Kinesis client
kinesis_client = boto3.client('kinesis', region_name='us-east-1')

# Kinesis stream name
stream_name = 'RealTimeDataStream'

while True:
    data = {
        'sensor_id': random.randint(1, 5),
        'temperature': round(random.uniform(20.0, 30.0), 2),
        'timestamp': int(time.time())
    }
    print(f"Sending data: {data}")
    kinesis_client.put_record(
        StreamName=stream_name,
        Data=json.dumps(data),
        PartitionKey=str(data['sensor_id'])
    )
    time.sleep(1)
