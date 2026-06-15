resource "aws_s3_bucket" "this" {
  count = var.create_s3_bucket ? 1 : 0

  bucket        = var.bucket
  bucket_prefix = var.bucket_prefix
  force_destroy = var.force_destroy

  tags = merge(
    { "Name" = var.name },
    var.tags,
    var.s3_bucket_tags,
  )
}

resource "aws_s3_bucket_versioning" "this" {
  count = var.create_s3_bucket && var.create_s3_bucket_versioning ? 1 : 0

  bucket = aws_s3_bucket.this[0].id

  versioning_configuration {
    status     = var.versioning_status
    mfa_delete = var.mfa_delete
  }

  # tags = merge(
  #   { "Name" = var.name },
  #   var.tags,
  #   var.s3_bucket_versioning_tags,
  # )
}

resource "aws_s3_bucket_public_access_block" "this" {
  count = var.create_s3_bucket && var.create_s3_bucket_public_access_block ? 1 : 0

  bucket = aws_s3_bucket.this[0].id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

  # tags = merge(
  #   { "Name" = var.name },
  #   var.tags,
  #   var.s3_bucket_public_access_block_tags,
  # )
}

resource "aws_s3_bucket_ownership_controls" "this" {
  count = var.create_s3_bucket && var.create_s3_bucket_ownership_controls ? 1 : 0

  bucket = aws_s3_bucket.this[0].id

  rule {
    object_ownership = var.object_ownership
  }

  # tags = merge(
  #   { "Name" = var.name },
  #   var.tags,
  #   var.s3_bucket_ownership_controls_tags,
  # )
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  count = var.create_s3_bucket && var.create_s3_bucket_server_side_encryption_configuration ? 1 : 0

  bucket = aws_s3_bucket.this[0].id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
      kms_master_key_id = var.kms_master_key_id
    }
    bucket_key_enabled = var.bucket_key_enabled
  }

  # tags = merge(
  #   { "Name" = var.name },
  #   var.tags,
  #   var.s3_bucket_server_side_encryption_configuration_tags,
  # )
}

resource "aws_s3_bucket_policy" "this" {
  count = var.create_s3_bucket && var.create_s3_bucket_policy ? 1 : 0

  bucket = aws_s3_bucket.this[0].id
  policy = var.bucket_policy

  # tags = merge(
  #   { "Name" = var.name },
  #   var.tags,
  #   var.s3_bucket_policy_tags,
  # )
}
