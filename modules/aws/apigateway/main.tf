resource "aws_apigatewayv2_api" "apigateway" {
  name          = var.apigateway_name
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "apigateway" {
  api_id      = aws_apigatewayv2_api.apigateway.id
  name        = "$default"
  auto_deploy = var.auto_deploy
}

resource "aws_apigatewayv2_route" "apigateway" {
  api_id    = aws_apigatewayv2_api.apigateway.id
  route_key = "$default"
  target    = "integrations/${aws_apigatewayv2_integration.apigateway.id}"
}


resource "aws_apigatewayv2_integration" "apigateway" {
  api_id             = aws_apigatewayv2_api.apigateway.id
  integration_type   = "HTTP_PROXY"
  integration_method = "ANY"
  integration_uri    = var.integration_uri
}
