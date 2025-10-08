terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


backend "s3" {
    bucket         = "ram-terra-state-bucket"
    key            = "terraform/state/terraform.tfstate"
    region         = "ap-south-1" 
    encrypt        = true
    dynamodb_table = "terra-lock-table" 
  }

}

provider "aws" {
  region  = var.region
}
