module "s3_bucket" {
  source = "../../modules/s3"

  enable_s3_bucket                    = true
  enable_s3_bucket_acl                = true
  s3_bucket_name                      = "dev-s3-bucket"
  s3_bucket_prefix                    = null
  s3_bucket_force_destroy             = false
  s3_bucket_object_lock_enabled       = false
  s3_bucket_acl_bucket                = ""
  s3_bucket_acl_acl                   = "private"
  s3_bucket_acl_expected_bucket_owner = ""
  s3_bucket_acl_access_control_policy = {}
  tags = {
    env  = "dev"
    type = "storage"
  }
}
