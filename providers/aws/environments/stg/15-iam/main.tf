module "iam" {
  source = "../../../../../modules/aws/iam"

  api_deploy_user = local.api_deploy_user
  cognito_arn     = data.terraform_remote_state.cognito.outputs.cognito_user_pool_arn
}
