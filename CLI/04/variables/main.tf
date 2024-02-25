provider "aws" {
  region = var.primary_region
  alias  = "piglet-avs"
}

# Interpolate variables in strings:

resource "aws_s3_bucket" "test_s3_bucket" {
  bucket = "${var.prefixes["development"]}-${var.bucket_name}"
  tags   = var.tags

}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse_config" {
  bucket = aws_s3_bucket.test_s3_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }
}
