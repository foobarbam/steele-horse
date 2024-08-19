data "aws_route53_zone" "this" {
  name = var.domain_name
}

resource "aws_cloudfront_origin_access_control" "this" {
  name        = "${var.domain_name}-OAC"
  description = "${var.domain_name} Cloudfront S3 OAC"

  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_function" "this" {
  name    = "redirect-www2domain"
  comment = "${var.domain_name} Cloudfront Redirect WWW to domain"
  runtime = "cloudfront-js-1.0"
  code    = file("jsdocs/redirect.js")
  publish = true
}

resource "aws_cloudfront_distribution" "this" {
  tags                = local.tags
  aliases             = local.domain_names
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name = aws_s3_bucket.this.bucket_regional_domain_name
    origin_id   = "${var.domain_name}-origin"

    origin_access_control_id = aws_cloudfront_origin_access_control.this.id
  }

  custom_error_response {
    error_code         = 404
    response_code      = 404
    response_page_path = "/404.html"
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "${var.domain_name}-origin"
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    function_association {
      event_type   = "viewer-request"
      function_arn = aws_cloudfront_function.this.arn
    }
  }

  viewer_certificate {
    acm_certificate_arn      = module.acm.acm_certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  depends_on = [
    module.acm
  ]
}

resource "aws_route53_record" "this" {
  count   = length(local.domain_names)
  zone_id = data.aws_route53_zone.this.zone_id
  type    = "A"
  name    = local.domain_names[count.index]
  alias {
    name                   = aws_cloudfront_distribution.this.domain_name
    zone_id                = aws_cloudfront_distribution.this.hosted_zone_id
    evaluate_target_health = false
  }
  depends_on = [
    aws_cloudfront_distribution.this
  ]
}

output "site_url" {
  value = "https://${local.domain_names[0]}"
}