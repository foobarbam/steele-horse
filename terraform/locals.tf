locals {
  sans         = formatlist("%s.${var.domain_name}", var.domain_hostnames)
  domain_names = concat([var.domain_name], local.sans)
  htmldir      = "../hugo/public"

  mime_types = {
    ".js"      = "application/javascript"
    ".map"     = "application/javascript"
    ".json"    = "application/json"
    ".pdf"     = "application/pdf"
    ".zip"     = "application/zip"
    ".mp3"     = "audio/mpeg"
    ".wav"     = "audio/wav"
    ".ttf"     = "font/ttf"
    ".woff2"   = "font/woff2"
    ".ico"     = "image/vnd.microsoft.icon"
    ".svg"     = "image/svg+xml"
    ".webp"    = "image/webp"
    ".tif"     = "image/tiff"
    ".tiff"    = "image/tiff"
    ".bmp"     = "image/bmp"
    ".jpe"     = "image/jpeg"
    ".jpeg"    = "image/jpeg"
    ".jfif"    = "image/jpeg"
    ".gif"     = "image/gif"
    ".jpg"     = "image/jpeg"
    ".png"     = "image/png"
    ".css"     = "text/css"
    ".html"    = "text/html"
    ".xml"     = "text/xml"
    ".txt"     = "text/plain"
    ".mp4"     = "video/mp4"
    ".webm"    = "video/webm"
    ".ogg"     = "video/ogg"
  }

  tags = {
    Name = var.domain_name
  }
}
