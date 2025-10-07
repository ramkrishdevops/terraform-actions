variable "role_name" {
  type = string
}

variable "assume_services" {
  type    = list(string)
  default = ["ec2.amazonaws.com"]  # example
}

variable "policy_document" {
  type = any
  description = "Map/object for policy document (JSON structure)"
  default = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = ["s3:*"]
        Effect = "Allow"
        Resource = "*"
      }
    ]
  }
}

variable "tags" {
  type    = map(string)
  default = {}
}

