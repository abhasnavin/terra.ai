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
  region = "us-east-1"
}

terraform {
  backend "s3" {
    key    = "terraform.tfstate"
    bucket = "terrabot-backend"
    region = "us-east-1"
  }
}
