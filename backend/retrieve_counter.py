import json
import boto3


def handler(event, context):
    dynamodb = boto3.resource("dynamodb")
    table = dynamodb.Table("cloudresume")

    # Retrieve current views count
    response = table.get_item(Key={"id": "1"})
    views = response["Item"]["views"]

    return {"statusCode": 200, "body": json.dumps({"views": views})}
