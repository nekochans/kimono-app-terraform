// ALB
resource "aws_security_group" "alb" {
  name        = var.sg_alb_name
  description = "Security Group to ${var.sg_alb_name}"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.sg_alb_name
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "alb" {
  security_group_id = aws_security_group.alb.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

// ECS
resource "aws_security_group" "ecs" {
  name        = var.sg_ecs_name
  description = var.sg_ecs_name
  vpc_id      = var.vpc_id

  tags = {
    Name = var.sg_ecs_name
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "ecs_from_alb" {
  security_group_id        = aws_security_group.ecs.id
  type                     = "ingress"
  from_port                = 8888
  to_port                  = 8888
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.alb.id
}
