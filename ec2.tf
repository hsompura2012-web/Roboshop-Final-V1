resource "aws_instance" "instance_launch" {
  for_each = var.component
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.main[each.key].id]

  tags = {
    Name = "${each.key}-${var.env}"
  }

}

resource "aws_route53_record" "Record_Launch" {
  for_each =  var.component
  zone_id = var.zone_id
  name    = "${each.key}-${var.env}"
  type    = "A"
  ttl     = 50
  records = [aws_instance.instance_launch[each.key].private_ip]
}