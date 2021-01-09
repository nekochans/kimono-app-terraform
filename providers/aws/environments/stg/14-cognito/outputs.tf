output "cognito_user_pool_endpoint" {
  value = module.cognito.cognito_user_pool_endpoint
}

output "cognito_user_pool_arn" {
  value = module.cognito.cognito_user_pool_arn
}

output "kimono_app_frontend_client_id" {
  value = module.cognito.kimono_app_frontend_client_id
}
