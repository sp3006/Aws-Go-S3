/***************************************************************

S3 bucket creation and creating the public access

****************************************************************/

resource "aws_s3_bucket" "susi_work_bucket" {
    bucket_prefix = "${var.name}-${var.environmet}-${var.region}-susi-bucket"
}

#Making bucket private

resource "aws_s3_bucket_acl" "susi_work_bucket_acl" {
  bucket = aws_s3_bucket.susi_work_bucket.id
  acl = "private"
}

# Configuring the bucket with encryption key

resource "aws_s3_server_side_encryption_configuration" "susi_work_bucket_configuration" {
    bucket = aws_s3_bucket.susi_work_bucket.bucket
    rule {
        apply_server_side_encryption_by_default {
            kms_master_key_id = aws_kms_key.data_key.arn
            sse_algorithm = "aws:kms"
        }
        bucket_key_enabled = true
    }
  
}

# Block public access
resource "aws_s3_bucket_public_access_block" "susi_work_bucket_block_public_access" {
    bucket = aws_s3_bucket.susi_work_bucket 
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}