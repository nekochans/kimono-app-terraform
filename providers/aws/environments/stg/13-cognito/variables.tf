locals {
  name = "kimono-app"
  env  = "stg"

  user_pool_name = "${local.env}-${local.name}"
}
