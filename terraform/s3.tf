#------------------------------
# Apache HUDI workbook bucket
#-----------------------------

resource "aws_s3_bucket" "hudi_bucket" {

  bucket = "218084585641-hudi-workbook"
  tags = local.resources_tags

}

resource "aws_s3_bucket_server_side_encryption_configuration" "hudi_bucket_sse" {
  bucket = aws_s3_bucket.hudi_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "hudi_bucket_public_access" {
  bucket = aws_s3_bucket.hudi_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

