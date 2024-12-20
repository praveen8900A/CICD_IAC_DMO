provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "dev_s3" {


  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "e92c023a-cc50-4dad-aa84-3275ceabfad7"

    git_last_modified_by = "praveenkumardpmtn@gmail.com"
    git_modifiers        = "praveenkumardpmtn"
    git_org              = "praveen8900A"
    git_repo             = "CICD_IAC_DMO"
  }
  bucket                               = "dev-20241219131304598100000001"
  server_side_encryption_configuration = { "rule" : { "apply_server_side_encryption_by_default" : { "sse_algorithm" : "AES256" } } }
}


resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
