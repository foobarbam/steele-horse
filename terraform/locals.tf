locals {
  sans         = formatlist("%s.${var.domain_name}", var.domain_hostnames)
  domain_names = concat([var.domain_name], local.sans)
  htmldir      = "../hugo/public"

  mime_types = {
    ".html" = "text/html"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".gif"  = "image/gif"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
  }

  tags = {
    Name = var.domain_name
  }
}
