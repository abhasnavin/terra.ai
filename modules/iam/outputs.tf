#-----------------------------------------------------------
# IAM role
#-----------------------------------------------------------
output "iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = element(concat(aws_iam_role.iam_role.*.arn, [""]), 0)
}

output "iam_role_name" {
  description = "The name of the role."
  value       = element(concat(aws_iam_role.iam_role.*.name, [""]), 0)
}

output "iam_role_id" {
  description = "The name of the role."
  value       = element(concat(aws_iam_role.iam_role.*.id, [""]), 0)
}
#-----------------------------------------------------------
# IAM user
#-----------------------------------------------------------
output "iam_user_arn" {
  description = "The ARN assigned by AWS for this user."
  value       = element(concat(aws_iam_user.iam_user.*.arn, [""]), 0)
}

output "iam_user_name" {
  description = "The user's name."
  value       = element(concat(aws_iam_user.iam_user.*.name, [""]), 0)
}

output "iam_user_unique_id" {
  description = "The unique ID assigned by AWS."
  value       = element(concat(aws_iam_user.iam_user.*.unique_id, [""]), 0)
}
#-----------------------------------------------------------
# IAM policy
#-----------------------------------------------------------
output "iam_policy_id" {
  description = "The policy's ID."
  value       = element(concat(aws_iam_policy.iam_policy.*.id, [""]), 0)
}

output "iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy."
  value       = element(concat(aws_iam_policy.iam_policy.*.arn, [""]), 0)
}


output "iam_policy_description" {
  description = "The description of the policy."
  value       = element(concat(aws_iam_policy.iam_policy.*.description, [""]), 0)
}

output "iam_policy_name" {
  description = "The name of the policy."
  value       = element(concat(aws_iam_policy.iam_policy.*.name, [""]), 0)
}

output "iam_policy_path" {
  description = "The path of the policy in IAM."
  value       = element(concat(aws_iam_policy.iam_policy.*.path, [""]), 0)
}

output "iam_policy_policy" {
  description = "The policy document."
  value       = element(concat(aws_iam_policy.iam_policy.*.policy, [""]), 0)
}

#-----------------------------------------------------------
# IAM Policy Attachment
#-----------------------------------------------------------
output "iam_policy_attachment_id" {
  description = "The policy's ID."
  value       = element(concat(aws_iam_policy.iam_policy.*.id, [""]), 0)
}

output "iam_policy_attachment_name" {
  description = "The name of the attachment."
  value       = element(concat(aws_iam_policy.iam_policy.*.name, [""]), 0)
}