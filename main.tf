terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = "Ram"
}

# VPC Module
module "vpc" {
  source             = "./modules/net"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  tags = {
    Environment = "Dev"
    Project     = "TerraformDemo"
  }
}

# S3 Module
module "s3" {
  source      = "./modules/s3"
  bucket_name = "ram-terra-bucket1"
  acl         = "private"
  versioning  = true
  tags = {
    Environment = "Dev"
    Project     = "TerraformDemo"
  }
}

# EC2 Module
module "ec2" {
  source            = "./modules/ec2"
  instance_type     = "t3.micro"
  ami               = "ami-052064a798f08f0d3"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.vpc.security_group_id
  public_key        = file("~/.ssh/id_ed25519.pub") # or your path
  tags = {
    Name        = "TerraformDemoInstance"
    Environment = "Dev"
  }
}

