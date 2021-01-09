output "cognito_user_pool_endpoint" {
  value = aws_cognito_user_pool.pool.endpoint
}

output "cognito_user_pool_arn" {
  value = aws_cognito_user_pool.pool.arn
}

output "kimono_app_frontend_client_id" {
  value = aws_cognito_user_pool_client.client.id
}
