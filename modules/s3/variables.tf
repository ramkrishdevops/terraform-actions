variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default = "ram-demo-terra-bucket1"
}

variable "acl" {
  description = "The ACL for the S3 bucket"
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
  default     = {}
}
