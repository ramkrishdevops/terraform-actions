terraform {
  required_version = ">= 1.4.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = var.s3_bucket_name
  tags        = var.tags
}

module "iam" {
  source     = "../../modules/iam"
  role_name  = var.iam_role_name
  tags       = var.tags
  # example: allow EC2 assume role
  assume_services = ["ec2.amazonaws.com"]
}

module "ec2" {
  source = "../../modules/ec2"
  name_prefix = var.name_prefix
  ami         = var.ami
  instance_type = var.instance_type
  public_key  = var.ssh_public_key
  tags        = var.tags
}
module "net" {
  source             = "../../modules/net"
  project_name       = "dev-environment"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone  = "us-east-1a"
}

