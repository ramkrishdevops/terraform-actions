terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "local" {} # you can later switch to S3 backend
}

provider "aws" {
  region  = var.region
}
