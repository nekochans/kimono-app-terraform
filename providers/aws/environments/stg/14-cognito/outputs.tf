output "cognito_user_pool_endpoint" {
  value = module.api.cognito_user_pool_endpoint
}

output "cognito_user_pool_arn" {
  value = module.api.cognito_user_pool_arn
}

output "kimono_app_frontend_client_id" {
  value = module.api.kimono_app_frontend_client_id
}
