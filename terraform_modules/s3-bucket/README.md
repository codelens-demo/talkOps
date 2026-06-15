# S3 Bucket Terraform Module

This module provisions an AWS S3 bucket configured for public asset storage by default, with essential configuration components like versioning, public access blocks, server-side encryption, and ownership controls. 

It adheres to security best practices, ensuring encryption at rest and providing mechanisms for secure public access management.

## Usage

```hcl
module "s3_bucket" {
  source = "./workspace/terraform_modules/s3-bucket"

  name   = "my-public-assets"
  bucket = "my-public-assets-bucket-name"
  
  # Versioning
  create_s3_bucket_versioning = true
  versioning_status           = "Enabled"
  
  # Public Access configuration (can be tailored depending on public access requirements)
  create_s3_bucket_public_access_block = true
  block_public_acls                    = false
  block_public_policy                  = false
  ignore_public_acls                   = false
  restrict_public_buckets              = false

  # Encryption
  create_s3_bucket_server_side_encryption_configuration = true
  sse_algorithm                                         = "AES256"

  tags = {
    Environment = "production"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_ownership_controls.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name tag for all resources | `string` | n/a | yes |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | Name of the bucket. If omitted, Terraform will assign a random, unique name. Conflicts with bucket\_prefix | `string` | `null` | no |
| <a name="input_bucket_prefix"></a> [bucket_prefix](#input\_bucket\_prefix) | Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket | `string` | `null` | no |
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Whether Amazon S3 should block public ACLs for this bucket. | `bool` | `true` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Whether Amazon S3 should block public bucket policies for this bucket. | `bool` | `true` | no |
| <a name="input_bucket_key_enabled"></a> [bucket\_key\_enabled](#input\_bucket\_key\_enabled) | Whether or not to use Amazon S3 Bucket Keys for SSE-KMS. | `bool` | `true` | no |
| <a name="input_bucket_policy"></a> [bucket\_policy](#input\_bucket\_policy) | The text of the policy. | `string` | `null` | no |
| <a name="input_create_s3_bucket"></a> [create\_s3\_bucket](#input\_create\_s3\_bucket) | Master toggle to create the S3 bucket | `bool` | `true` | no |
| <a name="input_create_s3_bucket_ownership_controls"></a> [create\_s3\_bucket\_ownership\_controls](#input\_create\_s3\_bucket\_ownership\_controls) | Toggle to configure S3 bucket ownership controls | `bool` | `true` | no |
| <a name="input_create_s3_bucket_policy"></a> [create\_s3\_bucket\_policy](#input\_create\_s3\_bucket\_policy) | Toggle to configure S3 bucket policy | `bool` | `false` | no |
| <a name="input_create_s3_bucket_public_access_block"></a> [create\_s3\_bucket\_public\_access\_block](#input\_create\_s3\_bucket\_public\_access\_block) | Toggle to configure S3 bucket public access block | `bool` | `true` | no |
| <a name="input_create_s3_bucket_server_side_encryption_configuration"></a> [create\_s3\_bucket\_server\_side\_encryption\_configuration](#input\_create\_s3\_bucket\_server\_side\_encryption\_configuration) | Toggle to configure S3 bucket server side encryption | `bool` | `true` | no |
| <a name="input_create_s3_bucket_versioning"></a> [create\_s3\_bucket\_versioning](#input\_create\_s3\_bucket\_versioning) | Toggle to configure S3 bucket versioning | `bool` | `true` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | `bool` | `false` | no |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Whether Amazon S3 should ignore public ACLs for this bucket. | `bool` | `true` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse\_algorithm as aws:kms | `string` | `null` | no |
| <a name="input_mfa_delete"></a> [mfa\_delete](#input\_mfa\_delete) | Specifies whether MFA delete is enabled in the bucket versioning configuration. Valid values: Enabled or Disabled. | `string` | `null` | no |
| <a name="input_object_ownership"></a> [object\_ownership](#input\_object\_ownership) | Object ownership. Valid values: BucketOwnerPreferred, ObjectWriter or BucketOwnerEnforced | `string` | `"BucketOwnerEnforced"` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Whether Amazon S3 should restrict public bucket policies for this bucket. | `bool` | `true` | no |
| <a name="input_s3_bucket_tags"></a> [s3\_bucket\_tags](#input\_s3\_bucket\_tags) | Tags specifically for the s3 bucket | `map(string)` | `{}` | no |
| <a name="input_sse_algorithm"></a> [sse\_algorithm](#input\_sse\_algorithm) | Server-side encryption algorithm to use. Valid values are AES256, aws:kms, and aws:kms:dsse | `string` | `"AES256"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to all resources | `map(string)` | `{}` | no |
| <a name="input_versioning_status"></a> [versioning\_status](#input\_versioning\_status) | Versioning state of the bucket. Valid values: Enabled, Suspended, or Disabled. | `string` | `"Enabled"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_s3_bucket_bucket_domain_name"></a> [s3\_bucket\_bucket\_domain\_name](#output\_s3\_bucket\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_s3_bucket_bucket_region"></a> [s3\_bucket\_bucket\_region](#output\_s3\_bucket\_bucket\_region) | The AWS region this bucket resides in. |
| <a name="output_s3_bucket_bucket_regional_domain_name"></a> [s3\_bucket\_bucket\_regional\_domain\_name](#output\_s3\_bucket\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. |
| <a name="output_s3_bucket_hosted_zone_id"></a> [s3\_bucket\_hosted\_zone\_id](#output\_s3\_bucket\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region. |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | The name of the bucket |
| <a name="output_s3_bucket_tags_all"></a> [s3\_bucket\_tags\_all](#output\_s3\_bucket\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
| <a name="output_s3_bucket_website_domain"></a> [s3\_bucket\_website\_domain](#output\_s3\_bucket\_website\_domain) | The domain of the website endpoint, if the bucket is configured with a website. |
| <a name="output_s3_bucket_website_endpoint"></a> [s3\_bucket\_website\_endpoint](#output\_s3\_bucket\_website\_endpoint) | The website endpoint, if the bucket is configured with a website. |
