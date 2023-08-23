#Chatbot says: 
module "s3_bucket" {
  source = "../../modules/s3"

  enable_s3_bucket = true
  s3_bucket_name = "r-private-s3-bucket"
  s3_bucket_force_destroy = null
  s3_bucket_prefix = null
  s3_bucket_object_lock_enabled = null

  enable_s3_bucket_acl = true
  s3_bucket_acl_bucket = "r-private-s3-bucket"
  s3_bucket_acl_expected_bucket_owner = null
  s3_bucket_acl_acl = "private"
  s3_bucket_acl_access_control_policy = []

  enable_s3_bucket_ownership_controls = true
  s3_bucket_ownership_controls_bucket = "r-private-s3-bucket"
  s3_bucket_ownership_controls_rule = [
    {
      object_ownership = "ObjectWriter"
    }
  ]

  tags = {
    Name = "r-private-s3-bucket"
    env = "dev"
  }
}