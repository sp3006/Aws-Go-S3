/***************************************************************

S3 bucket creation and creating the public access

****************************************************************/

resource "aws_s3_bucket" "susi_work_bucket" {
    bucket_prefix = "${var.app_name}-${var.environment}-${var.region}-susi-bucket"
}

#Making bucket private

resource "aws_s3_bucket_acl" "susi_work_bucket_acl" {
  bucket = aws_s3_bucket.susi_work_bucket.id
  acl = "private"
}

