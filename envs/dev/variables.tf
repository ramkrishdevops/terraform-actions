variable "region" { default = "us-east-1" }
variable "s3_bucket_name" { default = "tf-example-unique-bucket-12345" } # must be globally unique
variable "iam_role_name" { default = "tf-example-role" }
variable "name_prefix" { default = "tfdemo" }
variable "ami" { default = "ami-0c94855ba95c71c99" } # update for your region
variable "instance_type" { default = "t3.micro" }
variable "ssh_public_key" { type = string }
variable "tags" { type = map(string), default = { Environment = "dev" } }

