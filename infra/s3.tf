resource "aws_s3_bucket" "example" {
  bucket = "my-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
