variable "name_prefix" {
  type = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  type    = string
  default = null
}

variable "ec2_ami" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0f9708d1cd2cfee41"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ssh_allowed_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
variable "security_group_id" {
  description = "VPC Security Group ID for the EC2 instance"
  type        = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

