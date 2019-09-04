provider "aws" {
  region     = "${var.region}"
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
}

terraform {
  backend "s3" {
    bucket = "example-rails-aws-terraform"
    key    = "terraform.state"
    region = "ap-northeast-1"
  }
}
