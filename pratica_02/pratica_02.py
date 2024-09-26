import json
import requests
import boto3
from boto3.s3.transfer import S3UploadFailedError
from botocore.exceptions import ClientError
import zipfile
import csv
from io import BytesIO

def lambda_handler(event, context):
    print("start")
    
    s3_resource = boto3.resource("s3")
        
    obj = s3_resource.Object("s3-02231015", "alunos.zip")
    
    body = BytesIO(obj.get()["Body"].read())
     
    with zipfile.ZipFile(body, "r") as zip_ref:
        
        with open("prouni_2005_2019.csv", "r") as file:
        
            reader = csv.DictReader(file)

            json_data = []

            for row in reader:
                for i in row:
                    json_object = {}
                    json_object[i] = row[i]
                json_data.append(json_object)

            # Convert the list of dictionaries to a JSON string
            json_string = json.dumps(json_data, indent=4)
            return json_string

print(lambda_handler(None, None))