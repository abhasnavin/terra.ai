#Chatbot says: 
module "s3_bucket" {
  source = "../../modules/s3"

  enable_s3_bucket = true
  s3_bucket_name = "my-techconnectcs3-demo"
  s3_bucket_acl_acl = "private"
  enable_s3_bucket_acl = true
  s3_bucket_acl_access_control_policy = [
    {
      owner = {
        id = "ObjectWriter"
      },
      grant = [
        {
          permission = "FULL_CONTROL",
          grantee = {
            type = "CanonicalUser",
            id = "ObjectWriter"
          }
        }
      ]
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