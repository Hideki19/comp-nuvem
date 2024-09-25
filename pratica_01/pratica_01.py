import json
import requests
import boto3
from boto3.s3.transfer import S3UploadFailedError
from botocore.exceptions import ClientError

def lambda_handler(event, context):
    url = "https://olinda.bcb.gov.br/olinda/servico/Pix_DadosAbertos/versao/v1/odata/EstatisticasTransacoesPix(Database=@Database)?@Database='202011'&$top=100&$format=json"
    try:        
        resultado = requests.get(url)
        # Verifica se a requisição foi bem-sucedida
        resultado.raise_for_status()
        # Decodifica o JSON
        dados = resultado.json()
        # Extrai a lista de transações Pix
        transacoes = dados['value']
    
        s3_resource = boto3.resource("s3")
        bucket = s3_resource.Bucket("s3-02231015")
        
        obj = s3_resource.Object("s3-02231015", "transacoes.json")
        
        try:
            obj.put(
                Body=(bytes(json.dumps(transacoes).encode('UTF-8')))
            )
            print(
                f"Uploaded file transacoes.json into bucket s3-02231015 with key {obj.key}."
            )
        except S3UploadFailedError as err:
            print(f"Couldn't upload file transacoes.json to s3-02231015.")
            print(f"\t{err}")
        
        return transacoes
    except requests.exceptions.RequestException as e:
        print(f"Erro na requisição: {e}")
        return None
    except json.JSONDecodeError as e:
        print(f"Erro ao decodificar JSON: {e}")
        print(f"Resposta completa da API: {resultado.text}")
        return None

print(lambda_handler(None, None))