variable "project_name" {
  description = "Project name prefix for all resources"
  type        = string
  default     = "demo-terra"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone to deploy subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "tags" {
  description = "Additional tags for all resources"
  type        = map(string)
  default     = {}
}
