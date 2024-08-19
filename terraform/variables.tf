variable "aws_primary_region" {
  type        = string
  description = "Primary region where AWS resources are instantiated"
}

variable "domain_name" {
  type        = string
  description = "Domain name for the website"
}

variable "domain_hostnames" {
  type = list(string)
  default = [
    "www"
  ]
  description = "Hostnames uses for the SSL certificate's Subject Alternative Names (SANs)"
}

