resource "aws_security_group" "vpclink" {
  name        = var.sg_vpc_link_name
  description = "Security Group to ${var.sg_vpc_link_name}"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.sg_vpc_link_name
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "internal_alb" {
  security_group_id        = var.sg_internal_alb_id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.vpclink.id
}
