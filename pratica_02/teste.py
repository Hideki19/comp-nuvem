import json
import requests
import boto3
from boto3.s3.transfer import S3UploadFailedError
from botocore.exceptions import ClientError
import zipfile
import csv

def lambda_handler(event, context):
    print("start")
    
    s3_resource = boto3.resource("s3")
        
    obj = s3_resource.Object("s3-02231015", "alunos.zip")
        
    body = obj.get()["Body"].read()
    
    return body

print(lambda_handler(None, None))