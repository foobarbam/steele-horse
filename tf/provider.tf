terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  alias  = "default"
  region = var.aws_primary_region
}

# Per https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cnames-and-https-requirements.html
# "To use an ACM certificate with CloudFront, make sure you request (or import)
# the certificate in the US East (N. Virginia) Region (us-east-1)."
provider "aws" {
  alias  = "aws_acm_region"
  region = "us-east-1"
}