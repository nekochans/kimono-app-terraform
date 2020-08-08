variable "user_pool_name" {
  type = string
}

variable "user_pool_domain" {
  type = string
}

variable "resource_server_name" {
  type = string
}

variable "resource_server_identifier" {
  type = string
}

variable "ses_email_identity_arn" {
  type = string
}

variable "allowed_oauth_scopes" {
  type = list(string)
}

variable "callback_urls" {
  type = list(string)
}
