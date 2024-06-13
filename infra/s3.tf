resource "aws_s3_bucket" "example" {
  bucket = "my-test-bucket-dereck-ieee-5425984725694569"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
