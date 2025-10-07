module "net" {
  source             = "./modules/net"
  project_name       = var.project_name
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
<<<<<<< HEAD
  availability_zone  = "us-east-1"
=======
  availability_zone  = "us-east-1a"
}

module "ec2" {
  source            = "./modules/ec2"
  name_prefix       = var.project_name
  ami               = var.ec2_ami
  instance_type     = "t3.micro"
  public_key        = file(var.public_key_path)
  ssh_allowed_cidrs = ["0.0.0.0/0"]

  # Reference network resources from net module
  vpc_id            = module.net.vpc_id
  subnet_id         = module.net.public_subnet_id
  security_group_id = module.net.security_group_id
}

module "s3" {
  source       = "./modules/s3"
  name_prefix  = var.project_name
}

module "iam" {
  source       = "./modules/iam"
  name_prefix  = var.project_name
>>>>>>> fb86cba (initial commit (without Terraform binaries))
}

