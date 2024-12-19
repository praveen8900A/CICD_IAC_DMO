provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"

  tags = {
    Environment          = "Dev"
    git_commit           = "d4c35e0270bfd542051278ca30b4b3872c1ae0b2"
    git_file             = "code/simple_s3.tf"
    git_last_modified_at = "2024-01-26 23:01:56"
    git_last_modified_by = "tprendervill@paloaltonetworks.com"
    git_modifiers        = "tprendervill"
    git_org              = "praveen8900A"
    git_repo             = "CICD_IAC_DMO"
    yor_name             = "dev_s3"
    yor_trace            = "03b395c5-b69f-4aa3-898c-7d98d7161980"
  }
}


resource "aws_s3_bucket" "dev_s3_log_bucket" {
  bucket = "dev_s3-log-bucket"
}

resource "aws_s3_bucket_logging" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id

  target_bucket = aws_s3_bucket.dev_s3_log_bucket.id
  target_prefix = "log/"
}

