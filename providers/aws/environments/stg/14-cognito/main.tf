module "api" {
  source = "../../../../../modules/aws/cognito"

  user_pool_name         = local.user_pool_name
  ses_email_identity_arn = data.terraform_remote_state.ses.outputs.ses_email_identity_arn
}
