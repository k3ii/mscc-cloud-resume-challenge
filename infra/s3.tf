locals {
  content_type_map = {
    "js"   = "application/json"
    "html" = "text/html"
    "css"  = "text/css"
    "ico"  = "image/x-icon"
  }
}

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
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "null_resource" "always_run" {
  triggers = {
    timestamp = timestamp()
  }
}

resource "aws_s3_object" "crc_object" {
  for_each     = fileset(var.bucket_content, "**/*")
  bucket       = aws_s3_bucket.crc_bucket.bucket
  key          = each.value
  source       = "${var.bucket_content}/${each.value}"
  content_type = lookup(local.content_type_map, regex(".*\\.([a-zA-Z0-9]+)$", each.value)[0], "application/octet-stream")

  # This single etag line combines both the file hash and the null_resource ID
  etag = "${filemd5("${var.bucket_content}/${each.value}")}-${null_resource.always_run.id}"
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

resource "aws_s3_bucket_server_side_encryption_configuration" "crc_bucket" {
  bucket                = "mscc-crc-bucket-albert-einstein"
  expected_bucket_owner = null
  rule {
    bucket_key_enabled = true
    apply_server_side_encryption_by_default {
      kms_master_key_id = null
      sse_algorithm     = "AES256"
    }
  }
}

