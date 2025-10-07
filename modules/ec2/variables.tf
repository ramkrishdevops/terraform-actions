variable "name_prefix" { type = string }
variable "vpc_cidr" { type = string, default = "10.0.0.0/16" }
variable "subnet_cidr" { type = string, default = "10.0.1.0/24" }
variable "availability_zone" { type = string, default = null } 
variable "ami" { type = string }
variable "instance_type" { type = string, default = "t3.micro" }
variable "public_key" { type = string }
variable "ssh_allowed_cidrs" { type = list(string), default = ["0.0.0.0/0"] } # tighten for prod
variable "tags" { type = map(string), default = {} }

