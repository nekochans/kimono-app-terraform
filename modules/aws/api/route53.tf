resource "aws_route53_record" "api" {
  zone_id = var.zone_id
  name    = var.sub_domain_name
  type    = "A"

  alias {
    name                   = aws_alb.api_alb.dns_name
    zone_id                = aws_alb.api_alb.zone_id
    evaluate_target_health = false
  }
}
