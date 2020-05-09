resource "aws_s3_bucket" "test_bucket" {
  bucket = "my-tf-test-bucket-${var.region}-${var.environment}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }

  tags = {
    Name        = "My bucket"
    Environment = "${var.environment}"
  }
}

output "s3_bucket_name" {
  value = "${aws_s3_bucket.test_bucket.id}"
}

output "s3_bucket_arn" {
  value = "${aws_s3_bucket.test_bucket.arn}"
}
