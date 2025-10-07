variable "bucket_name" {
  type        = string
  description = "Name for the S3 bucket (must be globally unique)"
}

variable "acl" {
  type    = string
  default = "private"
}

variable "versioning" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}

