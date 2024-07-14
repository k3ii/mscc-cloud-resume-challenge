import json
import boto3
from botocore.exceptions import ClientError


def handler(event, context):
    dynamodb = boto3.resource("dynamodb")
    table = dynamodb.Table("cloudresume")

    try:
        # Retrieve current views count
        response = table.get_item(Key={"id": "1"})
        if "Item" in response:
            views = response["Item"]["countViews"]
        else:
            # If the item does not exist, create it with countViews set to 1
            table.put_item(Item={"id": "1", "countViews": 1})
            views = 1
    except ClientError as e:
        # Log any other ClientError
        print(e.response["Error"]["Message"])
        raise
    else:
        if "Item" in response:
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
