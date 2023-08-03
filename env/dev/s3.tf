#Chatbot says: 
module "s3_bucket" {
  source = "../../modules/s3"

  name        = "my-private-s3-bucket"
  environment = "PROD"

  enable_s3_bucket                  = true
  s3_bucket_name                    = "my-private-s3-bucket"
  s3_bucket_force_destroy           = null
  s3_bucket_object_lock_enabled     = null

  enable_s3_bucket_acl              = true
  s3_bucket_acl_bucket              = "my-private-s3-bucket"
  s3_bucket_acl_expected_bucket_owner = null
  s3_bucket_acl_acl                 = "private"
  s3_bucket_acl_access_control_policy = []

  enable_s3_bucket_ownership_controls = true
  s3_bucket_ownership_controls_bucket = "my-private-s3-bucket"
  s3_bucket_ownership_controls_rule   = []
}