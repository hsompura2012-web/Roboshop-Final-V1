resource "aws_security_group" "main" {
  for_each = var.component
  name        = "${each.key}-${var.env}}"
  description = "${each.key}-${var.env}"

  dynamic "ingress" {
    for_each = each.value["port"]
    content {
      from_port = ingress.value
      to_port = ingress.value
      cidr_ipv4   = ["0.0.0.0/0"]
      protocol = "tcp"
      description = ingress.key
    }
  }

   egress {
      from_port = 0
      to_port = 0
      cidr_ipv4   = "0.0.0.0/0"
      ip_protocol = "-1"

  }

}