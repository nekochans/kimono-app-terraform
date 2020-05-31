module "api" {
  source = "../../../../../modules/aws/cognito"

  user_pool_name = local.user_pool_name
}
