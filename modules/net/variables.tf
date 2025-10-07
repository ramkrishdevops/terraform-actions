variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "project_name" {
  description = "Project name used in resource tags"
  type        = string
  default     = "TerraformDemo"
}
variable "tags" {
  description = "Tags to apply to all network resources"
  type        = map(string)
  default     = {}
}
