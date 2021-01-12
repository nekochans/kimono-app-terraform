locals {
  name = "kimono-app"
  env  = "stg"

  api_alb_name                     = "${local.env}-${local.name}-api"
  sg_alb_name                      = "${local.env}-${local.name}-api-alb"
  api_internal_alb_name            = "${local.env}-${local.name}-api-internal"
  sg_internal_alb_name             = "${local.env}-${local.name}-api-internal-alb"
  alblogs_enabled                  = false
  sub_domain_name                  = "stg-api"
  ecs_cluster_name                 = "${local.env}-${local.name}"
  ecs_task_definition_name         = "${local.env}-${local.name}"
  ecs_service_name                 = "${local.env}-${local.name}"
  ecs_task_cpu                     = 256
  ecs_task_memory                  = 512
  sg_ecs_name                      = "${local.env}-${local.name}"
  cloudwatch_log_name              = "${local.env}-${local.name}"
  cloudwatch_log_retention_in_days = 7
}

locals {
  vpc_id              = data.terraform_remote_state.network.outputs.vpc_id
  subnet_public_ids   = data.terraform_remote_state.network.outputs.subnet_public_ids
  subnet_private_ids  = data.terraform_remote_state.network.outputs.subnet_private_ids
  ecr_api_url         = data.terraform_remote_state.ecr.outputs.ecr_api_url
  alb_certificate_arn = data.terraform_remote_state.acm.outputs.ap_northeast_1_acm_arn
}

locals {
  vpc_link_name              = "${local.env}-${local.name}"
  sg_vpc_link_name           = "${local.env}-${local.name}-vpc-link"
  apigateway_name            = "${local.env}-${local.name}-api"
  auto_deploy                = true
  integration_uri            = "https://${local.sub_domain_name}.${var.main_domain_name}"
  apigateway_domain_name     = "stg-apigateway.${var.main_domain_name}"
  apigateway_stage           = "$default"
  authorizer_audience        = [data.terraform_remote_state.cognito.outputs.kimono_app_frontend_client_id]
  cognito_user_pool_endpoint = "https://${data.terraform_remote_state.cognito.outputs.cognito_user_pool_endpoint}"
}

variable "main_domain_name" {
  type    = string
  default = ""
}

data "aws_route53_zone" "api" {
  name = var.main_domain_name
}
