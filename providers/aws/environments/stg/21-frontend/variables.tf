locals {
  env                = "stg"
  sub_domain_name    = local.env
  zone_id            = data.aws_route53_zone.frontend.zone_id
  vercel_cname_value = "cname.vercel-dns.com"
}

variable "main_domain_name" {
  type    = string
  default = ""
}

data "aws_route53_zone" "frontend" {
  name = var.main_domain_name
}
