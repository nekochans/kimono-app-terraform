variable "vpc_id" {
  type = string
}

variable "subnet_public_ids" {
  type = list(string)
}

variable "subnet_private_ids" {
  type = list(string)
}

variable "sub_domain_name" {
  type = string
}

variable "zone_id" {
  type = string
}

variable "sg_alb_name" {
  type = string
}

variable "api_alb_name" {
  type = string
}

variable "alb_certificate_arn" {
  type = string
}

variable "alblogs_enabled" {
  type = bool
}

variable "cloudwatch_log_name" {
  type = string
}

variable "cloudwatch_log_retention_in_days" {
  type = number
}

variable "ecs_cluster_name" {
  type = string
}

variable "ecs_task_definition_name" {
  type = string
}

variable "ecs_service_name" {
  type = string
}

variable "ecs_task_cpu" {
  type = string
}

variable "ecs_task_memory" {
  type = string
}

variable "sg_ecs_name" {
  type = string
}

variable "ecr_api_url" {
  type = string
}

data "aws_elb_service_account" "aws_elb_service_account" {}
data "aws_region" "current" {}
