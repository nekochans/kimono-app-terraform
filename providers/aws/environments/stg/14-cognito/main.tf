module "api" {
  source = "../../../../../modules/aws/cognito"

  user_pool_name             = local.user_pool_name
  user_pool_domain           = local.user_pool_domain
  resource_server_name       = local.resource_server_name
  resource_server_identifier = local.resource_server_identifier
  ses_email_identity_arn     = data.terraform_remote_state.ses.outputs.ses_email_identity_arn
  allowed_oauth_scopes       = local.allowed_oauth_scopes
  callback_urls              = local.callback_urls
}
