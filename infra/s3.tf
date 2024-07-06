resource "aws_s3_bucket" "crc_bucket" {
  bucket        = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "crc_bucket_website" {
  bucket = aws_s3_bucket.crc_bucket.id
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "crc_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.crc_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_s3_object" "crc_object" {
  for_each = fileset(var.bucket_content, "**/*")

  bucket       = aws_s3_bucket.crc_bucket.bucket
  key          = each.value
  source       = "${var.bucket_content}/${each.value}"
  content_type = each.value.content_type

}

resource "aws_s3_bucket_policy" "crc_bucket_policy" {
  bucket = aws_s3_bucket.crc_bucket.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject"
        ]
        Resource = "${aws_s3_bucket.crc_bucket.arn}/*"
      },
    ]
  })
}

