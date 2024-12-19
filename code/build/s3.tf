provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "3674fdeb-42de-459d-9306-c4f8f75e6ef5"
    git_commit           = "6374430f82d2675f6cc3992d0af2c84dd6d7c7a0"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2024-12-19 13:07:16"
    git_last_modified_by = "praveenkumardpmtn@gmail.com"
    git_modifiers        = "praveenkumardpmtn"
    git_org              = "praveen8900A"
    git_repo             = "CICD_IAC_DMO"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
