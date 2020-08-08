locals {
  name = "kimono-app"
  env  = "stg"

  user_pool_name             = "${local.env}-${local.name}"
  user_pool_domain           = "${local.env}-${local.name}"
  resource_server_name       = "${local.env}-${local.name}"
  resource_server_identifier = "${local.env}-${local.name}"
  allowed_oauth_scopes       = ["openid", "stg-kimono-app/admin", "stg-kimono-app/normal"]
  callback_urls              = ["http://localhost:3000"]
}
