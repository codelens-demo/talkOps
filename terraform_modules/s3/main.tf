resource "aws_s3_bucket" "this" {
  count = var.create_s3_bucket ? 1 : 0

  bucket = var.bucket
  bucket_prefix = var.bucket_prefix
  force_destroy = var.force_destroy

  tags = merge(
    { "Name" = var.name },
    var.tags,
  )
}

resource "aws_s3_bucket_versioning" "this" {
  count = var.create_s3_bucket_versioning ? 1 : 0

  bucket = aws_s3_bucket.this[0].id
  versioning_configuration {
    status = var.versioning_status
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  count = var.create_s3_bucket_server_side_encryption_configuration ? 1 : 0

  bucket = aws_s3_bucket.this[0].id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
      kms_master_key_id = var.kms_master_key_id
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  count = var.create_s3_bucket_public_access_block ? 1 : 0

  bucket = aws_s3_bucket.this[0].id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_logging" "this" {
  count = var.create_s3_bucket_logging ? 1 : 0

  bucket = aws_s3_bucket.this[0].id

  target_bucket = var.target_bucket
  target_prefix = var.target_prefix
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  count = var.create_s3_bucket_lifecycle_configuration ? 1 : 0

  bucket = aws_s3_bucket.this[0].id

  rule {
    id      = "default"
    status  = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    expiration {
      days = 90
    }

    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "GLACIER"
    }

    noncurrent_version_expiration {
      noncurrent_days = 90
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}

resource "aws_s3_bucket_policy" "this" {
  count = var.create_s3_bucket_policy ? 1 : 0

  bucket = aws_s3_bucket.this[0].id
  policy = var.policy
}