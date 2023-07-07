module "s3_private_bucket" {
  source      = "../../modules/s3"

  # AWS S3 bucket
  enable_s3_bucket = true
  s3_bucket_name   = "test-s3-bucket-rg01"

  // Enable S3 bucket ACL
  enable_s3_bucket_acl = true
  s3_bucket_acl_acl    = "private"

  //enable s3 bucket ownership
  enable_s3_bucket_ownership_controls = true
  s3_bucket_ownership_controls_rule   = [
    {
      object_ownership = "ObjectWriter"
    }
  ]

  tags = {
    "Environment"   = "test",
    "Orchestration" = "Terraform"
  }
}
