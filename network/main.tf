resource "aws_security_group" "main" {
  name        = "RoboShop_security_group"
  description = "roboshop security group"
  tags = {
    name = "RoboShop_security_group"
  }
 }

resource "aws_vpc_security_group_ingress_rule" "allow_incoming" {
  security_group_id = aws_security_group.main.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_outgoing" {
  security_group_id = aws_security_group.main.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}