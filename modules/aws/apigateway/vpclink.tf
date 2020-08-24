resource "aws_apigatewayv2_vpc_link" "vpilink" {
  name               = var.vpc_link_name
  security_group_ids = [aws_security_group.vpclink.id]
  subnet_ids         = var.subnet_private_ids

  tags = {
    Usage = var.vpc_link_name
  }
}
