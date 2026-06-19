variable "name" {
  description = "Name tag for all resources"
  type        = string
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}

variable "create_s3_bucket" {
  description = "Master toggle"
  type        = bool
  default     = true
}

variable "bucket" {
  description = "Name of the bucket. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "bucket_prefix" {
  description = "Creates a unique bucket name beginning with the specified prefix. Conflicts with `bucket`."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "Boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error."
  type        = bool
  default     = false
}

variable "create_s3_bucket_versioning" {
  description = "Enable versioning."
  type        = bool
  default     = true
}

variable "versioning_status" {
  description = "Versioning status. Can be `Enabled`, `Suspended`, or `Disabled`."
  type        = string
  default     = "Enabled"
}

variable "create_s3_bucket_server_side_encryption_configuration" {
  description = "Enable server-side encryption."
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use. Can be `AES256` or `aws:kms`."
  type        = string
  default     = "AES256"
}

variable "kms_master_key_id" {
  description = "The AWS KMS master key ID used for the SSE-KMS encryption. This is required if you specify `aws:kms` as the `sse_algorithm`."
  type        = string
  default     = null
}

variable "create_s3_bucket_public_access_block" {
  description = "Enable public access block."
  type        = bool
  default     = true
}

variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
  default     = true
}

variable "create_s3_bucket_logging" {
  description = "Enable S3 bucket logging."
  type        = bool
  default     = false
}

variable "target_bucket" {
  description = "Name of the bucket where you want Amazon S3 to store server access logs."
  type        = string
  default     = null
}

variable "target_prefix" {
  description = "Prefix for all log object keys."
  type        = string
  default     = null
}

variable "create_s3_bucket_lifecycle_configuration" {
  description = "Enable S3 bucket lifecycle configuration."
  type        = bool
  default     = true
}

variable "create_s3_bucket_policy" {
  description = "Enable S3 bucket policy."
  type        = bool
  default     = false
}

variable "policy" {
  description = "Valid bucket policy JSON document."
  type        = string
  default     = null
}