resource "aws_s3_bucket" "data" {
  # bucket is public
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "${local.resource_prefix.value}-data"
  force_destroy = true

  tags = {
    git_commit           = "d4c35e0270bfd542051278ca30b4b3872c1ae0b2"
    git_file             = "code/deployment_s3.tf"
    git_last_modified_at = "2024-01-26 23:01:56"
    git_last_modified_by = "tprendervill@paloaltonetworks.com"
    git_modifiers        = "tprendervill"
    git_org              = "praveen8900A"
    git_repo             = "CICD_IAC_DMO"
    yor_name             = "data"
    yor_trace            = "200ad512-d6e7-49d0-8cd7-0b583f36ff5c"
  }
}

resource "aws_s3_bucket_object" "data_object" {
  bucket = aws_s3_bucket.data.id
  key    = "customer-master.xlsx"
  source = "resources/customer-master.xlsx"

  tags = {
    git_commit           = "9b387b078b6b2b32b65501021d1ed720352b71eb"
    git_file             = "code/deployment_s3.tf"
    git_last_modified_at = "2024-01-26 23:01:56"
    git_last_modified_by = "tprendervill@paloaltonetworks.com"
    git_modifiers        = "tprendervill"
    git_org              = "praveen8900A"
    git_repo             = "CICD_IAC_DMO"
    yor_name             = "data_object"
    yor_trace            = "7f50ff6a-30fc-4c45-aa64-9e691187d9db"
  }
}

resource "aws_s3_bucket" "financials" {
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "${local.resource_prefix.value}-financials"
  acl           = "private"
  force_destroy = true

  tags = {
    git_commit           = "9b387b078b6b2b32b65501021d1ed720352b71eb"
    git_file             = "code/deployment_s3.tf"
    git_last_modified_at = "2024-01-26 23:01:56"
    git_last_modified_by = "tprendervill@paloaltonetworks.com"
    git_modifiers        = "tprendervill"
    git_org              = "praveen8900A"
    git_repo             = "CICD_IAC_DMO"
    yor_name             = "financials"
    yor_trace            = "f1037029-dad2-4ed8-a94b-efa43cb61a3d"
  }
}

resource "aws_s3_bucket" "operations" {
  # bucket is not encrypted
  # bucket does not have access logs
  bucket = "${local.resource_prefix.value}-operations"
  acl    = "private"
  versioning {
    enabled = true
  }
  force_destroy = true

  tags = {
    git_commit           = "9b387b078b6b2b32b65501021d1ed720352b71eb"
    git_file             = "code/deployment_s3.tf"
    git_last_modified_at = "2024-01-26 23:01:56"
    git_last_modified_by = "tprendervill@paloaltonetworks.com"
    git_modifiers        = "tprendervill"
    git_org              = "praveen8900A"
    git_repo             = "CICD_IAC_DMO"
    yor_name             = "operations"
    yor_trace            = "76d0ba33-e761-4b14-8cb5-187403b83bb5"
  }
}

resource "aws_s3_bucket" "data_science" {
  # bucket is not encrypted
  bucket = "${local.resource_prefix.value}-data-science"
  acl    = "private"
  versioning {
    enabled = true
  }
  logging {
    target_bucket = "${aws_s3_bucket.logs.id}"
    target_prefix = "log/"
  }
  force_destroy = true

  tags = {
    git_commit           = "9b387b078b6b2b32b65501021d1ed720352b71eb"
    git_file             = "code/deployment_s3.tf"
    git_last_modified_at = "2024-01-26 23:01:56"
    git_last_modified_by = "tprendervill@paloaltonetworks.com"
    git_modifiers        = "tprendervill"
    git_org              = "praveen8900A"
    git_repo             = "CICD_IAC_DMO"
    yor_name             = "data_science"
    yor_trace            = "db052650-db13-4967-9787-4e6e553efc6c"
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "${local.resource_prefix.value}-logs"
  acl    = "log-delivery-write"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = "${aws_kms_key.logs_key.arn}"
      }
    }
  }
  force_destroy = true

  tags = {
    git_commit           = "9b387b078b6b2b32b65501021d1ed720352b71eb"
    git_file             = "code/deployment_s3.tf"
    git_last_modified_at = "2024-01-26 23:01:56"
    git_last_modified_by = "tprendervill@paloaltonetworks.com"
    git_modifiers        = "tprendervill"
    git_org              = "praveen8900A"
    git_repo             = "CICD_IAC_DMO"
    yor_name             = "logs"
    yor_trace            = "178aa7dc-462f-480c-9038-6e1adc530a2c"
  }
}
