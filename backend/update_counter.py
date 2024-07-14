import json
import boto3


def handler(event, context):
    dynamodb = boto3.resource("dynamodb")
    table = dynamodb.Table("cloudresume")

    # Retrieve current views count
    response = table.get_item(Key={"id": "1"})
    views = response["Item"]["views"]

    # Increment views count
    views += 1

    # Update DynamoDB with new views count
    table.update_item(
        Key={"id": "1"},
        UpdateExpression="SET views = :val",
        ExpressionAttributeValues={":val": views},
    )

    return {
        "statusCode": 200,
        "body": json.dumps({"message": "Counter incremented successfully"}),
    }
