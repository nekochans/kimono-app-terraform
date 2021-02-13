resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = var.sub_domain_name
  type    = "CNAME"

  ttl = "5"

  records = [var.vercel_cname_value]
}
