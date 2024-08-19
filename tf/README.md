## Requirements
* The domain and route53 zone must be registered manually in AWS
* Edit a file named `terraform.tfvars` and setup your primary AWS region and domain name

## Example
* `terraform apply -var="aws_primary_region=us-east-2" -var="domain_name=steele-horse.com"`

## Resources
https://medium.com/@walid.karray/mastering-static-website-hosting-on-aws-with-terraform-a-step-by-step-tutorial-5401ccd2f4fb