resource "aws_dynamodb_table" "cloudresumechallenge" {
  name           = "cloudresume"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "views"
    type = "N"
  }

  global_secondary_index {
    name            = "ViewsIndex"
    hash_key        = "views"
    read_capacity   = 1
    write_capacity  = 1
    projection_type = "ALL"
  }

  tags = {
    Name        = "cloudresumechallenge-dynamodb-table"
    Environment = "production"
  }
}
