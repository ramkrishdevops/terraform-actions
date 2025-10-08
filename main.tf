
module "net" {
  source             = "./modules/net"
  project_name       = var.project_name
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone  = "ap-south-1a"
}

module "ec2" {
  source            = "./modules/ec2"
  name_prefix       = var.project_name
  ec2_ami           = var.ec2_ami                # <-- Use ec2_ami, not ami
  instance_type     = "t3.micro"
  subnet_cidr       = "10.0.1.0/24"              # <-- Use subnet_cidr, not subnet_id
  security_group_id = module.net.security_group_id
  tags              = {}
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "ram-demo-terra-bucket1"
  acl         = "private"
  versioning  = false
  tags        = {}
}


module "iam" {
  source           = "./modules/iam"
  role_name        = "demo-ec2-role"
  assume_services  = ["ec2.amazonaws.com"]
  policy_document  = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
          "s3:GetObject"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetBucketVersioning",
          "s3:PutBucketVersioning"
        ]
        Resource = "arn:aws:s3:::ram-terra-bucket1"
      }
    ]
  }
  tags = {
    Environment = "Dev"
    Project     = "TerraformDemo"
  }
}

variable "ec2_ami" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0f9708d1cd2cfee41"
}


variable "project_name" {
  description = "Project name for resource naming"
  type        = string
  default     = "demo-project"
}

