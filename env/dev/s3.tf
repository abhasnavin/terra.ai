#Chatbot says: 
module "s3_bucket" {
  source = "../../modules/s3"

  enable_s3_bucket = true
  s3_bucket_name = "my-aws-private-bucket"
  tags = {
    environment = "PROD"
  }

  enable_s3_bucket_acl = true
  s3_bucket_acl_bucket = "my-aws-private-bucket"
  s3_bucket_acl_acl = "private"

  enable_s3_bucket_ownership_controls = true
  s3_bucket_ownership_controls_bucket = "my-aws-private-bucket"
  s3_bucket_ownership_controls_rule = [
    {
      object_ownership = "ObjectWriter"
    }
  ]
}