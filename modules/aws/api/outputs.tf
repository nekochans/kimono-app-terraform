output "sg_internal_alb_id" {
  value = aws_security_group.internal_alb.id
}

output "internal_alb_listener_arn" {
  value = aws_alb_listener.internal.arn
}
