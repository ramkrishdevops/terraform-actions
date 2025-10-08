resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
 

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = var.versioning ? "Enabled" : "Suspended"
  }
}
