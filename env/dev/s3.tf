#Chatbot says: 
module "s3_bucket" {
  source = "../../modules/s3"

  enable_s3_bucket = true
  s3_bucket_name = "new-private-s3-bucket"
  s3_bucket_acl_acl = "private"
  enable_s3_bucket_acl = true
  s3_bucket_acl_access_control_policy = [
    {
      owner = {
        id = "ObjectWriter"
        display_name = "ObjectWriter"
      }
      grant = []
    }
  ]
  enable_s3_bucket_ownership_controls = true
  s3_bucket_ownership_controls_rule = [
    {
      object_ownership = "ObjectWriter"
    }
  ]

  tags = {
    env = "dev"
  }
}