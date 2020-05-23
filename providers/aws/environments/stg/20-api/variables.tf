locals {
  name = "kimono-app"
  env  = "stg"

  api_alb_name             = "${local.env}-${local.name}-api"
  sg_alb_name              = "${local.env}-${local.name}-api-alb"
  alblogs_enabled          = false
  alb_certificate_arn      = ""
  ecs_cluster_name         = "${local.env}-${local.name}"
  ecs_task_definition_name = "${local.env}-${local.name}"
  ecs_service_name         = "${local.env}-${local.name}"
  ecs_task_cpu             = 256
  ecs_task_memory          = 512

  sg_ecs_name                      = "${local.env}-${local.name}"
  cloudwatch_log_name              = "${local.env}-${local.name}"
  cloudwatch_log_retention_in_days = 7
}

locals {
  vpc_id             = data.terraform_remote_state.network.outputs.vpc_id
  subnet_public_ids  = data.terraform_remote_state.network.outputs.subnet_public_ids
  subnet_private_ids = data.terraform_remote_state.network.outputs.subnet_private_ids
  ecr_api_url        = data.terraform_remote_state.ecr.outputs.ecr_api_url
}

// TODO ドメイン取得後に追加
//variable "main_domain_name" {
//  type    = string
//  default = ""
//}
//
//data "aws_acm_certificate" "main" {
//  domain = "*.${var.main_domain_name}"
//}
