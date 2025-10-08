variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "assume_services" {
  description = "List of AWS services that can assume the role"
  type        = list(string)
}

variable "policy_document" {
  description = "IAM policy document in JSON format"
  type        = any
}

variable "tags" {
  description = "Tags to apply to IAM resources"
  type        = map(string)
  default     = {}
}
