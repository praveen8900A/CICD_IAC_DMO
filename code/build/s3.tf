provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "e92c023a-cc50-4dad-aa84-3275ceabfad7"
    git_commit           = "1228fe2d192c01722d32656cb0bc97ebddcb64a1"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2024-12-19 13:08:52"
    git_last_modified_by = "praveenkumardpmtn@gmail.com"
    git_modifiers        = "praveenkumardpmtn"
    git_org              = "praveen8900A"
    git_repo             = "CICD_IAC_DMO"
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


resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
