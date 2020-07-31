module "api" {
  source = "../../../../../modules/aws/api"

  subnet_public_ids                = local.subnet_public_ids
  subnet_private_ids               = local.subnet_private_ids
  vpc_id                           = local.vpc_id
  sub_domain_name                  = local.sub_domain_name
  zone_id                          = data.aws_route53_zone.api.zone_id
  sg_alb_name                      = local.sg_alb_name
  api_alb_name                     = local.api_alb_name
  alblogs_enabled                  = local.alblogs_enabled
  alb_certificate_arn              = local.alb_certificate_arn
  ecs_cluster_name                 = local.ecs_cluster_name
  ecs_task_definition_name         = local.ecs_task_definition_name
  ecs_service_name                 = local.ecs_service_name
  sg_ecs_name                      = local.sg_ecs_name
  ecs_task_cpu                     = local.ecs_task_cpu
  ecs_task_memory                  = local.ecs_task_memory
  ecr_api_url                      = local.ecr_api_url
  cloudwatch_log_name              = local.cloudwatch_log_name
  cloudwatch_log_retention_in_days = local.cloudwatch_log_retention_in_days
}

module "apigateway" {
  source = "../../../../../modules/aws/apigateway"

  apigateway_name            = local.apigateway_name
  apigateway_stage           = local.apigateway_stage
  authorizer_audience        = local.authorizer_audience
  cognito_user_pool_endpoint = local.cognito_user_pool_endpoint
  auto_deploy                = local.auto_deploy
  integration_uri            = local.integration_uri
  apigateway_domain_name     = local.apigateway_domain_name
  certificate_arn            = local.alb_certificate_arn
  zone_id                    = data.aws_route53_zone.api.zone_id
}
