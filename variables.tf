variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Prefix name for all AWS resources"
  type        = string
  default     = "terraform-demo"
}

