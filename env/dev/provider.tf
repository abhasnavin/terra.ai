terraform {
  required_version = ">= 1.4"  # Specify the minimum required Terraform version
}

provider "aws" {
  version = ">= 3.0, < 4.0"  # Specify the AWS provider version constraint
  region  = "us-west-2"      # Update with your desired AWS region
  # Add any other provider configurations if needed
}
