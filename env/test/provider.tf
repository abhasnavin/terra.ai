terraform {
  required_version = ">= 1.4" # Specify the minimum required Terraform version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0, < 4.0"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "terraAI"
    workspaces { prefix = "test-" }
  }
}
#
#provider "aws" {
#  version = ">= 3.0, < 4.0"  # Specify the AWS provider version constraint
#  region  = "us-west-2"      # Update with your desired AWS region
#  # Add any other provider configurations if needed
#}
