variable "ami" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for instance"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to attach"
  type        = string
}

variable "public_key" {
  description = "Public key for SSH access"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for naming EC2 resources"
  type        = string
  default     = "demo"
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}

