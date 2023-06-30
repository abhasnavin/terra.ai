variable "enable_s3_bucket" {
  description = "Enable creation of S3 bucket"
  type        = bool
  default     = true
}

variable "enable_s3_bucket_acl" {
  description = "Enable creation of S3 bucket ACL"
  type        = bool
  default     = true
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = null
}

variable "s3_bucket_prefix" {
  description = "Prefix for the S3 bucket"
  type        = string
  default     = null
}

variable "s3_bucket_force_destroy" {
  description = "Set to true to enable force destroy of the S3 bucket"
  type        = bool
  default     = false
}

variable "s3_bucket_object_lock_enabled" {
  description = "Set to true to enable object lock for the S3 bucket"
  type        = bool
  default     = false
}

variable "s3_bucket_acl_bucket" {
  description = "The name of the S3 bucket to associate the ACL with"
  type        = string
  default     = ""
}

variable "s3_bucket_acl_acl" {
  description = "The canned ACL to apply. Must be one of private, public-read, public-read-write, authenticated-read, log-delivery-write, bucket-owner-read, bucket-owner-full-control"
  type        = string
  default     = "private"
}

variable "s3_bucket_acl_expected_bucket_owner" {
  description = "The expected owner of the bucket"
  type        = string
  default     = ""
}

variable "s3_bucket_acl_access_control_policy" {
  description = "A map representing the access control policy of the bucket"
  type        = map(any)
  default     = {}
}

variable "tags" {
  description = "Additional tags for the resources"
  type        = map(string)
  default     = {}
}
