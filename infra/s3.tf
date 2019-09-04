resource "aws_s3_bucket" "tf_state" {
  bucket = "example-rails-aws-terraform"

  versioning {
    enabled = true
  }
}
