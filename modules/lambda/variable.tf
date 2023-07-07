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
  description = "A list of tag blocks."
  type        = map(string)
  default     = {}
}

#---------------------------------------------------
# AWS Lambda function
#---------------------------------------------------
variable "enable_lambda_function" {
  description = "Enable lambda function usage"
  default     = false
}

variable "lambda_function_name" {
  description = "A unique name for your Lambda Function."
  default     = ""
}

variable "lambda_function_handler" {
  description = "(Required) The function entrypoint in your code."
  default     = null
}

variable "lambda_function_role" {
  description = "(Required) IAM role attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to. See Lambda Permission Model for more details."
  default     = null
}

variable "lambda_function_runtime" {
  description = "(Required) See Runtimes for valid values. Valid Values: nodejs10.x | nodejs12.x | java8 | java11 | python2.7 | python3.6 | python3.7 | python3.8 | dotnetcore2.1 | dotnetcore3.1 | go1.x | ruby2.5 | ruby2.7 | provided"
  default     = "python3.7"
}

variable "lambda_function_filename" {
  description = "(Optional) The path to the function's deployment package within the local filesystem. If defined, The s3_-prefixed options cannot be used."
  default     = null
}

variable "lambda_function_s3_bucket" {
  description = "(Optional) The S3 bucket location containing the function's deployment package. Conflicts with lambda_function_filename. This bucket must reside in the same AWS region where you are creating the Lambda function."
  default     = null
}

variable "lambda_function_s3_key" {
  description = "(Optional) The S3 key of an object containing the function's deployment package. Conflicts with lambda_function_filename."
  default     = null
}

variable "lambda_function_s3_object_version" {
  description = "(Optional) The object version containing the function's deployment package. Conflicts with lambda_function_filename."
  default     = null
}

variable "lambda_function_dead_letter_config" {
  description = "(Optional) Nested block to configure the function's dead letter queue."
  default     = []
}

variable "lambda_function_tracing_config" {
  description = "Use tracing config"
  default     = []
}

variable "lambda_function_description" {
  description = "(Optional) Description of what your Lambda Function does."
  default     = null
}

variable "lambda_function_layers" {
  description = "(Optional) List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function. See Lambda Layers"
  default     = null
}

variable "lambda_function_memory_size" {
  description = "(Optional) Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128"
  default     = 128
}

variable "lambda_function_timeout" {
  description = "(Optional) The amount of time your Lambda Function has to run in seconds. Defaults to 3."
  default     = 3
}

variable "lambda_function_reserved_concurrent_executions" {
  description = "(Optional) The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1"
  default     = "-1"
}

variable "lambda_function_publish" {
  description = "(Optional) Whether to publish creation/change as new Lambda Function Version. Defaults to false."
  default     = false
}

variable "lambda_function_vpc_config" {
  description = "(Optional) Provide this to allow your function to access your VPC."
  default     = []
}

variable "lambda_function_kms_key_arn" {
  description = "(Optional) Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables. If this configuration is not provided when environment variables are in use, AWS Lambda uses a default service key. If this configuration is provided when environment variables are not in use, the AWS Lambda API does not save this configuration and Terraform will show a perpetual difference of adding the key. To fix the perpetual difference, remove this configuration."
  default     = null
}

variable "lambda_function_source_code_hash" {
  description = "(Optional) Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key. The usual way to set this is filebase64sha256('file.zip') (Terraform 0.11.12 and later) or base64sha256(file('file.zip')) (Terraform 0.11.11 and earlier), where 'file.zip' is the local filename of the lambda function source archive."
  default     = null
}

variable "lambda_function_environment" {
  description = "(Optional) The Lambda environment's configuration settings."
  default     = null
}

variable "lambda_function_timeouts" {
  description = "Set timeouts for AWS Lambda"
  default     = {}
}

#---------------------------------------------------
# AWS lambda alias
#---------------------------------------------------
variable "enable_lambda_alias" {
  description = "Enable AWS LAmbda alias usage"
  default     = false
}

variable "lambda_alias_name" {
  description = "Name for the alias you are creating. Pattern: (?!^[0-9]+$)([a-zA-Z0-9-_]+)"
  default     = ""
}

variable "lambda_alias_description" {
  description = "(Optional) Description of the alias."
  default     = null
}

variable "lambda_alias_function_name" {
  description = "The function ARN of the Lambda function for which you want to create an alias."
  default     = ""
}

variable "lambda_alias_function_version" {
  description = "(Required) Lambda function version for which you are creating the alias."
  default     = "$LATEST"
}

variable "lambda_alias_routing_config" {
  description = "(Optional) The Lambda alias' route configuration settings."
  default     = {}
}

#---------------------------------------------------
# AWS lambda permission
#---------------------------------------------------
variable "enable_lambda_permission" {
  description = "Enable lambda permission"
  default     = false
}

variable "lambda_permission_action" {
  description = "(Required) The AWS Lambda action you want to allow in this statement. (e.g. lambda:InvokeFunction)"
  default     = null
}

variable "lambda_permission_function_name" {
  description = "Name of the Lambda function whose resource policy you are updating"
  default     = ""
}

variable "lambda_permission_principal" {
  description = "(Required) The principal who is getting this permission. e.g. s3.amazonaws.com, an AWS account ID, or any valid AWS service principal such as events.amazonaws.com or sns.amazonaws.com."
  default     = null
}

variable "lambda_permission_event_source_token" {
  description = "(Optional) The Event Source Token to validate. Used with Alexa Skills."
  default     = null
}

variable "lambda_permission_qualifier" {
  description = "(Optional) Query parameter to specify function version or alias name. The permission will then apply to the specific qualified ARN. e.g. arn:aws:lambda:aws-region:acct-id:function:function-name:2"
  default     = null
}

variable "lambda_permission_source_account" {
  description = "(Optional) This parameter is used for S3 and SES. The AWS account ID (without a hyphen) of the source owner."
  default     = null
}

variable "lambda_permission_source_arn" {
  description = "(Optional) When granting Amazon S3 or CloudWatch Events permission to invoke your function, you should specify this field with the Amazon Resource Name (ARN) for the S3 Bucket or CloudWatch Events Rule as its value. This ensures that only events generated from the specified bucket or rule can invoke the function. API Gateway ARNs have a unique structure."
  default     = null
}

variable "lambda_permission_statement_id" {
  description = "(Optional) A unique statement identifier. By default generated by Terraform."
  default     = null
}

variable "lambda_permission_statement_id_prefix" {
  description = "(Optional) A statement identifier prefix. Terraform will generate a unique suffix. Conflicts with statement_id."
  default     = null
}