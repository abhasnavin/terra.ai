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
  description = "A list of tag blocks. Each element should have keys"
  type        = map(string)
  default     = {}
}

#-----------------------------------------------------------
# IAM role
#-----------------------------------------------------------
variable "enable_iam_role" {
  description = "Enable IAM role creation"
  default     = false
}

variable "iam_role_name" {
  description = "The name of the role"
  default     = ""
}

variable "iam_role_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with iam_role_name."
  default     = ""
}

variable "iam_role_description" {
  description = "(Optional) The description of the role."
  default     = ""
}

variable "iam_role_assume_role_policy" {
  description = "File with assume role policy"
  default     = ""
}

variable "iam_role_force_detach_policies" {
  description = "(Optional) Specifies to force detaching any policies the role has before destroying it. Defaults to false."
  default     = false
}

variable "iam_role_path" {
  description = "(Optional) The path to the role. See IAM Identifiers for more information. Defaults is '/'"
  default     = "/"
}

variable "iam_role_max_session_duration" {
  description = "(Optional) The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  default     = 3600
}

variable "iam_role_permissions_boundary" {
  description = "(Optional) The ARN of the policy that is used to set the permissions boundary for the role."
  default     = null
}

#-----------------------------------------------------------
# IAM user
#-----------------------------------------------------------
variable "enable_iam_user" {
  description = "Enable iam_user usage"
  default     = false
}

variable "iam_user_name" {
  description = "(Required) The user's name. The name must consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-_.. User names are not distinguished by case. For example, you cannot create users named both 'TESTUSER' and 'testuser'."
  default     = ""
}

variable "iam_user_path" {
  description = "(Optional, default '/') Path in which to create the user."
  default     = null
}

variable "iam_user_permissions_boundary" {
  description = "(Optional) The ARN of the policy that is used to set the permissions boundary for the user."
  default     = null
}

variable "iam_user_force_destroy" {
  description = "(Optional, default false) When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  default     = null
}

#-----------------------------------------------------------
# IAM policy
#-----------------------------------------------------------
variable "enable_iam_policy" {
  description = "Enable IAM policy usage/creation"
  default     = false
}

variable "iam_policy_policy" {
  description = "(Required) The policy document. This is a JSON formatted string. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide"
  default     = ""
}

variable "iam_policy_name" {
  description = "Set custom policy name"
  default     = null
}

variable "iam_policy_name_prefix" {
  description = "Enable IAM policy with name_prefix usage"
  default     = null
}

variable "iam_policy_description" {
  description = "(Optional, Forces new resource) Description of the IAM policy."
  default     = null
}

variable "iam_policy_path" {
  description = "(Optional, default '/') Path in which to create the policy. See IAM Identifiers for more information."
  default     = null
}

#-----------------------------------------------------------
# IAM Policy Attachment
#-----------------------------------------------------------
variable "enable_iam_policy_attachment" {
  description = "Enabling IAM policy attachment"
  default     = false
}

variable "iam_policy_attachment_name" {
  description = "Set custom iam policy attachment name"
  default     = ""
}

variable "iam_policy_attachment_roles" {
  description = "(Optional) - The role(s) the policy should be applied to"
  default     = null
}

variable "iam_policy_attachment_users" {
  description = "(Optional) - The user(s) the policy should be applied to"
  default     = null
}

variable "iam_policy_attachment_groups" {
  description = "(Optional) - The group(s) the policy should be applied to"
  default     = null
}

variable "iam_policy_attachment_policy_arn" {
  description = "The ARN of the policy you want to apply"
  default     = ""
}