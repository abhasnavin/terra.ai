terraform {
  required_version = ">= 1.3.5" # Specify the minimum required Terraform version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0, < 4.0"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "terraAI"
    workspaces { name = "ai-dev" }
  }
  #  backend "s3" {
  #    bucket = "glue-terraform-backend"
  #    key    = "terraform.tfstate"
  #    region = "ap-southeast-2"
  #  }
}

provider "aws" {
  region = "us-west-2" # Update with your desired AWS region
  # Add any other provider configurations if needed
}
