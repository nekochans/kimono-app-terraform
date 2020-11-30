locals {
  name            = "kimono-app"
  env             = "stg"
  api_deploy_user = "${local.env}-${local.name}-api-deploy"
}
