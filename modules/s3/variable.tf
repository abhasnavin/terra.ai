#-----------------------------------------------------------
# Global or/and default variables
#-----------------------------------------------------------
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "TEST"
}

variable "environment" {
  description = "Environment for service"
  default     = "STAGE"
}

variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, etc."
  type        = map(string)
  default     = {}
}

#-----------------------------------------------------------
# S3 bucket
#-----------------------------------------------------------
variable "enable_s3_bucket" {
  description = "Enable to create S3 bucket by default"
  default     = false
}

variable "s3_bucket_name" {
  description = "Name for bucket name. Conflicts with s3_bucket_prefix."
  default     = null
}

variable "s3_bucket_prefix" {
  description = "Creates a unique bucket name beginning with the specified prefix. Conflicts with s3_bucket_name."
  default     = null
}

variable "s3_bucket_force_destroy" {
  description = "(Optional) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  default     = null
}

variable "s3_bucket_object_lock_enabled" {
  description = "(Optional, Default:false, Forces new resource) Indicates whether this bucket has an Object Lock configuration enabled."
  default     = null
}

#---------------------------------------------------
# AWS S3 bucket acl
#---------------------------------------------------
variable "enable_s3_bucket_acl" {
  description = "Enable s3 bucket acl usage"
  default     = false
}

variable "s3_bucket_acl_bucket" {
  description = "The name of the bucket"
  default     = ""
}

variable "s3_bucket_acl_expected_bucket_owner" {
  description = "(Optional, Forces new resource) The account ID of the expected bucket owner."
  default     = null
}

variable "s3_bucket_acl_acl" {
  description = "(Optional, Conflicts with access_control_policy) The canned ACL to apply to the bucket."
  default     = null
}

variable "s3_bucket_acl_access_control_policy" {
  description = "(Optional, Conflicts with acl) A configuration block that sets the ACL permissions for an object per grantee"
  default     = []
}