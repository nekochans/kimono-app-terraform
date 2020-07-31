variable "apigateway_name" {
  type = string
}

variable "apigateway_stage" {
  type = string
}

variable "authorizer_audience" {
  type = list(string)
}

variable "cognito_user_pool_endpoint" {
  type = string
}

variable "auto_deploy" {
  type = bool
}

variable "integration_uri" {
  type = string
}

variable "certificate_arn" {
  type = string
}

variable "zone_id" {
  type = string
}

variable "apigateway_domain_name" {
  type = string
}
