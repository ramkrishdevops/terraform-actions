terraform {
  backend "s3" {
    bucket = "tf-state-ram-bucket"
    key    = "envs/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
