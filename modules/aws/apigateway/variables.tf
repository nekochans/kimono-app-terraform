variable "vpc_id" {
  type = string
}

variable "subnet_private_ids" {
  type = list(string)
}

variable "vpc_link_name" {
  type = string
}

variable "sg_vpc_link_name" {
  type = string
}

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

variable "sg_internal_alb_id" {
  type = string
}

variable "internal_alb_listener_arn" {
  type = string
}
