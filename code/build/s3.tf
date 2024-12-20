provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"
  acl           = "private"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "e92c023a-cc50-4dad-aa84-3275ceabfad7"
    git_commit           = "7108ad23b5635593c75e6e20e9450caa6109a77d"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2024-12-20 09:47:46"
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
