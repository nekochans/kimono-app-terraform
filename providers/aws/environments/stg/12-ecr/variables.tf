locals {
  name         = "kimono-app"
  env          = "stg"
  ecr_api_name = "${local.env}-${local.name}-api"
}
