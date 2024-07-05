resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "crc_bucket" {
  bucket        = "crc-${random_string.bucket_suffix.result}"
  force_destroy = true
}

resource "aws_s3_bucket_website" "crc_bucket_website" {
  bucket = aws_s3_bucket.crc_bucket.bucket
  index_document = {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "crc_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.crc_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "crc_object" {
  bucket = aws_s3_bucket.crc_bucket.bucket
  key    = "index.html"
  source = "index.html"
}

resource "aws_s3_bucket_policy" "crc_bucket_policy" {
  bucket = aws_s3_bucket.crc_bucket.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.crc_bucket.arn}/*"
      },
    ]
  })
}
