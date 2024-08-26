terraform {
  backend "s3" {
    bucket = "shllc-tf-state"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}