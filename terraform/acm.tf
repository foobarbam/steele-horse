# https://github.com/terraform-aws-modules/terraform-aws-acm/blob/master/outputs.tf

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"
  providers = {
    aws = aws.aws_acm_region
  }

  domain_name = data.aws_route53_zone.this.name
  zone_id     = data.aws_route53_zone.this.zone_id

  validation_method         = "DNS"
  subject_alternative_names = local.sans
  wait_for_validation       = true

  tags = local.tags
}