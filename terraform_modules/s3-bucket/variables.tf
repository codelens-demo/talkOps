variable "name" {
  type        = string
  description = "Name tag for all resources"
}

variable "create_s3_bucket" {
  type        = bool
  default     = true
  description = "Master toggle to create the S3 bucket"
}

variable "bucket" {
  type        = string
  default     = null
  description = "Name of the bucket. If omitted, Terraform will assign a random, unique name. Conflicts with bucket_prefix"
}

variable "bucket_prefix" {
  type        = string
  default     = null
  description = "Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags applied to all resources"
}

variable "s3_bucket_tags" {
  type        = map(string)
  default     = {}
  description = "Tags specifically for the s3 bucket"
}

variable "s3_bucket_versioning_tags" {
  type        = map(string)
  default     = {}
  description = "Tags specifically for the s3 bucket versioning"
}

variable "s3_bucket_public_access_block_tags" {
  type        = map(string)
  default     = {}
  description = "Tags specifically for the s3 bucket public access block"
}

variable "s3_bucket_ownership_controls_tags" {
  type        = map(string)
  default     = {}
  description = "Tags specifically for the s3 bucket ownership controls"
}

variable "s3_bucket_server_side_encryption_configuration_tags" {
  type        = map(string)
  default     = {}
  description = "Tags specifically for the s3 bucket server side encryption"
}

variable "s3_bucket_policy_tags" {
  type        = map(string)
  default     = {}
  description = "Tags specifically for the s3 bucket policy"
}

# Versioning
variable "create_s3_bucket_versioning" {
  type        = bool
  default     = true
  description = "Toggle to configure S3 bucket versioning"
}

variable "versioning_status" {
  type        = string
  default     = "Enabled"
  description = "Versioning state of the bucket. Valid values: Enabled, Suspended, or Disabled."
}

variable "mfa_delete" {
  type        = string
  default     = null
  description = "Specifies whether MFA delete is enabled in the bucket versioning configuration. Valid values: Enabled or Disabled."
}

# Public Access Block
variable "create_s3_bucket_public_access_block" {
  type        = bool
  default     = true
  description = "Toggle to configure S3 bucket public access block"
}

variable "block_public_acls" {
  type        = bool
  default     = true
  description = "Whether Amazon S3 should block public ACLs for this bucket."
}

variable "block_public_policy" {
  type        = bool
  default     = true
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
}

variable "ignore_public_acls" {
  type        = bool
  default     = true
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
}

variable "restrict_public_buckets" {
  type        = bool
  default     = true
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
}

# Ownership Controls
variable "create_s3_bucket_ownership_controls" {
  type        = bool
  default     = true
  description = "Toggle to configure S3 bucket ownership controls"
}

variable "object_ownership" {
  type        = string
  default     = "BucketOwnerEnforced"
  description = "Object ownership. Valid values: BucketOwnerPreferred, ObjectWriter or BucketOwnerEnforced"
}

# SSE Configuration
variable "create_s3_bucket_server_side_encryption_configuration" {
  type        = bool
  default     = true
  description = "Toggle to configure S3 bucket server side encryption"
}

variable "sse_algorithm" {
  type        = string
  default     = "AES256"
  description = "Server-side encryption algorithm to use. Valid values are AES256, aws:kms, and aws:kms:dsse"
}

variable "kms_master_key_id" {
  type        = string
  default     = null
  description = "AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse_algorithm as aws:kms"
}

variable "bucket_key_enabled" {
  type        = bool
  default     = true
  description = "Whether or not to use Amazon S3 Bucket Keys for SSE-KMS."
}

# Policy
variable "create_s3_bucket_policy" {
  type        = bool
  default     = false
  description = "Toggle to configure S3 bucket policy"
}

variable "bucket_policy" {
  type        = string
  default     = null
  description = "The text of the policy."
}
