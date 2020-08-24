resource "aws_apigatewayv2_api" "apigateway" {
  name          = var.apigateway_name
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "apigateway" {
  api_id      = aws_apigatewayv2_api.apigateway.id
  name        = var.apigateway_stage
  auto_deploy = var.auto_deploy

  lifecycle {
    ignore_changes = [deployment_id]
  }
}

resource "aws_apigatewayv2_route" "apigateway" {
  api_id             = aws_apigatewayv2_api.apigateway.id
  route_key          = "$default"
  target             = "integrations/${aws_apigatewayv2_integration.vpclink.id}"
  authorization_type = "JWT"
  authorizer_id      = aws_apigatewayv2_authorizer.apigateway.id
}

resource "aws_apigatewayv2_integration" "vpclink" {
  api_id = aws_apigatewayv2_api.apigateway.id

  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.vpilink.id
  integration_type   = "HTTP_PROXY"
  integration_method = "ANY"
  integration_uri    = var.internal_alb_listener_arn

  lifecycle {
    ignore_changes = [passthrough_behavior]
  }
}

resource "aws_apigatewayv2_authorizer" "apigateway" {
  api_id           = aws_apigatewayv2_api.apigateway.id
  authorizer_type  = "JWT"
  identity_sources = ["$request.header.Authorization"]
  name             = "cognito"

  jwt_configuration {
    audience = var.authorizer_audience
    issuer   = var.cognito_user_pool_endpoint
  }
}

resource "aws_apigatewayv2_domain_name" "apigateway" {
  domain_name = var.apigateway_domain_name

  domain_name_configuration {
    certificate_arn = var.certificate_arn
    endpoint_type   = "REGIONAL"
    security_policy = "TLS_1_2"
  }
}

resource "aws_apigatewayv2_api_mapping" "apigateway" {
  api_id      = aws_apigatewayv2_api.apigateway.id
  stage       = aws_apigatewayv2_stage.apigateway.id
  domain_name = aws_apigatewayv2_domain_name.apigateway.domain_name
}
