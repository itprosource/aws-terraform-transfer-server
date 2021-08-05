resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name
  acl    = var.acl_type

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.s3_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
  # logging {
  #   target_bucket = aws_s3_bucket.s3_logs.id
  #   target_prefix = "log/"
  # }

  tags = {
    Name        = var.bucket_name
  }
}

# resource "aws_s3_bucket" "s3_logs" {
#   bucket = "${var.bucket_name}-logs"
#   acl    = "private"

#   tags = {
#     Name        = "${var.bucket_name}-logs"
#   }
# }

resource "aws_kms_key" "s3_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}