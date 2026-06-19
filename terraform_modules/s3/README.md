# Terraform AWS S3 Staging Bucket Module

This Terraform module creates a general-purpose S3 bucket for staging environments with best practices baked in.

## Features

-   **Versioning:** Enabled by default to protect against accidental deletions.
-   **Server-Side Encryption:** SSE-S3 enabled by default to protect data at rest.
-   **Public Access Block:** All public access is blocked by default.
-   **Lifecycle Policies:** Configured to transition objects to lower-cost storage and expire old versions.
-   **Access Logging:** Optional logging to a target bucket.

## Usage

```hcl
module "s3_staging_bucket" {
  source = "./terraform_modules/s3"

  name   = "my-staging-bucket"
  bucket = "my-staging-bucket-name"

  tags = {
    Environment = "staging"
    Project     = "my-project"
  }
}
```

## Inputs

| Name                                                 | Description                                                                                                                     | Type         | Default | Required |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ------------ | ------- | :------: |
| `name`                                               | Name tag for all resources                                                                                                      | `string`     | n/a     |   yes    |
| `tags`                                               | Tags applied to all resources                                                                                                   | `map(string)`| `{}`    |    no    |
| `create_s3_bucket`                                   | Master toggle                                                                                                                   | `bool`       | `true`  |    no    |
| `bucket`                                             | Name of the bucket. If omitted, Terraform will assign a random, unique name.                                                    | `string`     | `null`  |    no    |
| `bucket_prefix`                                      | Creates a unique bucket name beginning with the specified prefix. Conflicts with `bucket`.                                      | `string`     | `null`  |    no    |
| `force_destroy`                                      | Boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. | `bool`       | `false` |    no    |
| `create_s3_bucket_versioning`                        | Enable versioning.                                                                                                              | `bool`       | `true`  |    no    |
| `versioning_status`                                  | Versioning status. Can be `Enabled`, `Suspended`, or `Disabled`.                                                                | `string`     | `Enabled` |    no    |
| `create_s3_bucket_server_side_encryption_configuration` | Enable server-side encryption.                                                                                                | `bool`       | `true`  |    no    |
| `sse_algorithm`                                      | The server-side encryption algorithm to use. Can be `AES256` or `aws:kms`.                                                      | `string`     | `AES256`|    no    |
| `kms_master_key_id`                                  | The AWS KMS master key ID used for the SSE-KMS encryption. This is required if you specify `aws:kms` as the `sse_algorithm`.       | `string`     | `null`  |    no    |
| `create_s3_bucket_public_access_block`               | Enable public access block.                                                                                                     | `bool`       | `true`  |    no    |
| `block_public_acls`                                  | Whether Amazon S3 should block public ACLs for this bucket.                                                                     | `bool`       | `true`  |    no    |
| `block_public_policy`                                | Whether Amazon S3 should block public bucket policies for this bucket.                                                          | `bool`       | `true`  |    no    |
| `ignore_public_acls`                                 | Whether Amazon S3 should ignore public ACLs for this bucket.                                                                    | `bool`       | `true`  |    no    |
| `restrict_public_buckets`                            | Whether Amazon S3 should restrict public bucket policies for this bucket.                                                       | `bool`       | `true`  |    no    |
| `create_s3_bucket_logging`                           | Enable S3 bucket logging.                                                                                                       | `bool`       | `false` |    no    |
| `target_bucket`                                      | Name of the bucket where you want Amazon S3 to store server access logs.                                                        | `string`     | `null`  |    no    |
| `target_prefix`                                      | Prefix for all log object keys.                                                                                                 | `string`     | `null`  |    no    |
| `create_s3_bucket_lifecycle_configuration`           | Enable S3 bucket lifecycle configuration.                                                                                       | `bool`       | `true`  |    no    |
| `create_s3_bucket_policy`                            | Enable S3 bucket policy.                                                                                                        | `bool`       | `false` |    no    |
| `policy`                                             | Valid bucket policy JSON document.                                                                                              | `string`     | `null`  |    no    |

## Outputs

| Name                                    | Description                                                                                                                                                             |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `s3_bucket_id`                          | The name of the bucket.                                                                                                                                                 |
| `s3_bucket_arn`                         | The ARN of the bucket. Will be of format `arn:aws:s3:::bucketname`.                                                                                                       |
| `s3_bucket_bucket_domain_name`          | The bucket domain name. Will be of format `bucketname.s3.amazonaws.com`.                                                                                                |
| `s3_bucket_bucket_regional_domain_name` | The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront distribution will not connect to this bucket endpoint when used as an origin. |
| `s3_bucket_hosted_zone_id`              | The Route 53 Hosted Zone ID for this bucket's region.                                                                                                                   |
| `s3_bucket_region`                      | The AWS region this bucket resides in.                                                                                                                                  |
| `s3_bucket_website_endpoint`            | The website endpoint, if the bucket is configured with a website. If not, this will be an empty string.                                                                  |
| `s3_bucket_website_domain`              | The domain of the website endpoint, if the bucket is configured with a website. This will be the same as the `website_endpoint` except the scheme (protocol) will be removed. |