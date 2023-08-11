terraform {
  required_version = ">= 1.3.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0, < 4.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

terraform {
  backend "s3" {
    key    = "terraform.tfstate"
    bucket = "glue-terraform-backend"
    region = "ap-southeast-2"
  }
}
