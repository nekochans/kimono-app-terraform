resource "aws_cognito_user_pool" "pool" {
  name                     = var.user_pool_name
  auto_verified_attributes = ["email"]

  admin_create_user_config {
    allow_admin_create_user_only = false
  }

  password_policy {
    minimum_length                   = 8
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 7
  }

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
    email_message        = "検証コードは {####} です。"
    email_subject        = "検証コード"
    sms_message          = "検証コードは {####} です。"
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true

    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }

  email_configuration {
    source_arn            = var.ses_email_identity_arn
    email_sending_account = "DEVELOPER"
  }
}

resource "aws_cognito_user_pool_client" "client" {
  name                          = var.user_pool_name
  user_pool_id                  = aws_cognito_user_pool.pool.id
  generate_secret               = false
  prevent_user_existence_errors = "ENABLED"
  refresh_token_validity        = 30
  explicit_auth_flows           = ["ALLOW_USER_SRP_AUTH", "ALLOW_USER_PASSWORD_AUTH", "ALLOW_ADMIN_USER_PASSWORD_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]

  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_scopes                 = var.allowed_oauth_scopes
  callback_urls                        = var.callback_urls
  supported_identity_providers         = ["COGNITO"]
  allowed_oauth_flows                  = ["code"]

}

resource "aws_cognito_user_pool_domain" "domain" {
  domain       = var.user_pool_domain
  user_pool_id = aws_cognito_user_pool.pool.id
}
