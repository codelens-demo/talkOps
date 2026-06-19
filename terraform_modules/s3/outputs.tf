output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = try(aws_s3_bucket.this[0].id, null)
}

output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format `arn:aws:s3:::bucketname`."
  value       = try(aws_s3_bucket.this[0].arn, null)
}

output "s3_bucket_bucket_domain_name" {
  description = "The bucket domain name. Will be of format `bucketname.s3.amazonaws.com`."
  value       = try(aws_s3_bucket.this[0].bucket_domain_name, null)
}

output "s3_bucket_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront distribution will not connect to this bucket endpoint when used as an origin."
  value       = try(aws_s3_bucket.this[0].bucket_regional_domain_name, null)
}

output "s3_bucket_hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = try(aws_s3_bucket.this[0].hosted_zone_id, null)
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in."
  value       = try(aws_s3_bucket.this[0].region, null)
}

output "s3_bucket_website_endpoint" {
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = try(aws_s3_bucket.this[0].website_endpoint, null)
}

output "s3_bucket_website_domain" {
  description = "The domain of the website endpoint, if the bucket is configured with a website. This will be the same as the `website_endpoint` except the scheme (protocol) will be removed."
  value       = try(aws_s3_bucket.this[0].website_domain, null)
}