module "frontend" {
  source = "../../../../../modules/aws/frontend"

  zone_id            = local.zone_id
  sub_domain_name    = local.sub_domain_name
  vercel_cname_value = local.vercel_cname_value
}
