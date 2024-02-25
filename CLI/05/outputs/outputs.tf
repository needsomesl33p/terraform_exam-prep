output "bucket_id" {
  description = "Bucket ID"
  value       = aws_s3_bucket.test_s3_bucket.id
}

output "bucket_region" {
  description = "Bucket location / region"
  value       = aws_s3_bucket.test_s3_bucket.region
}

output "environment" {
  value = var.prefixes[var.environment]
}

# Redact sensitive outputs
output "secret_output" {
  value     = aws_s3_bucket.test_s3_bucket.arn
  sensitive = true
}
