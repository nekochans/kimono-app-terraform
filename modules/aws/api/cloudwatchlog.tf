resource "aws_cloudwatch_log_group" "ecs_api" {
  name              = var.cloudwatch_log_name
  retention_in_days = var.cloudwatch_log_retention_in_days
}
