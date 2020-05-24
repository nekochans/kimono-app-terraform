resource "aws_alb" "api_alb" {
  name                       = var.api_alb_name
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb.id]
  subnets                    = var.subnet_public_ids
  enable_deletion_protection = false

  access_logs {
    enabled = var.alblogs_enabled
    bucket  = aws_s3_bucket.api_alb_logs.bucket
  }

  tags = {
    Name = var.api_alb_name
  }
}

resource "aws_alb_target_group" "api" {
  name     = var.api_alb_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    interval            = 20
    matcher             = 200
  }

  target_type = "ip"
}

resource "aws_alb_listener" "api" {
  load_balancer_arn = aws_alb.api_alb.id
  port              = 443
  protocol          = "HTTPS"

  ssl_policy      = "ELBSecurityPolicy-2016-08"
  certificate_arn = var.alb_certificate_arn

  lifecycle {
    ignore_changes = [default_action]
  }

  default_action {
    target_group_arn = aws_alb_target_group.api.id
    type             = "forward"
  }
}
