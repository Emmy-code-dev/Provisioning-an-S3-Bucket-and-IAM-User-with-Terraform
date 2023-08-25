module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "azubi-project"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "azubi-project"

  object_lock_enabled = true
}

resource "aws_s3_bucket_object_lock_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}