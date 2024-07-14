import json
import boto3
from botocore.exceptions import ClientError


def handler(event, context):
    dynamodb = boto3.resource("dynamodb")
    table = dynamodb.Table("cloudresume")

    try:
        # Retrieve current views count
        response = table.get_item(Key={"id": "1"})
        views = response["Item"]["countViews"]
    except ClientError as e:
        if e.response["Error"]["Code"] == "ResourceNotFoundException":
            # If the item does not exist, create it with countViews set to 1
            table.put_item(Item={"id": "1", "countViews": 1})
            views = 1
        else:
            # If some other error occurred, log it and re-raise
            print(e.response["Error"]["Message"])
            raise
    else:
        # Increment views count
        views += 1

        # Update DynamoDB with new views count
        table.update_item(
            Key={"id": "1"},
            UpdateExpression="SET countViews = :val",
            ExpressionAttributeValues={":val": views},
        )

    return {
        "statusCode": 200,
        "body": {"message": "Counter incremented successfully", "views": views},
    }
