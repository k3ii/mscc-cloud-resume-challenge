resource "aws_iam_policy" "cloudresume_api_policy" {
  name        = "cloudresume_api_policy"
  description = "Policy for lambda to update counter"
  policy      = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "ec2:DescribeSnapshots",
          "ec2:DescribeImages",
          "s3:PutObject",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource": "*"
      }
    ]
  }
EOF
}

resource "aws_iam_role" "cloudresume_api_role" {
  name               = "cloudresume_api_role"
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "lambda.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  }
EOF
}

resource "aws_iam_role_policy_attachment" "cloudresume_api_policy_attachment" {
  role       = aws_iam_role.cloudresume_api_role.name
  policy_arn = aws_iam_policy.cloudresume_api_policy.arn
}
