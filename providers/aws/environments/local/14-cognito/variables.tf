locals {
  name = "kimono-app"
  env  = "local"

  user_pool_name             = "${local.env}-${local.name}"
  user_pool_domain           = "${local.env}-${local.name}"
  resource_server_name       = "${local.env}-${local.name}"
  resource_server_identifier = "${local.env}-${local.name}"
  allowed_oauth_scopes       = ["openid"]
  callback_urls              = ["http://localhost:3100"]
}
