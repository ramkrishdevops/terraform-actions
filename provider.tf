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
<<<<<<< HEAD

provider "aws" {
  region = var.aws_region
  profile = "Ram"
=======
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
>>>>>>> fb86cba (initial commit (without Terraform binaries))
}

