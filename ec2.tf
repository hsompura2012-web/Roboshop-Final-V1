resource "aws_instance" "instance_launch" {
  for_each = var.component
  ami           = var.ami
  instance_type = each.value["instance_type"]
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

resource "null_resource" "Instance_null" {
  depends_on = [

    aws_instance.instance_launch,
    aws_route53_record.Record_Launch
  ]

  for_each = var.component
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = aws_instance.instance_launch[each.key].private_ip
    }
    inline =  [
      "sudo dnf install python3.13-pip -y",
      "sudo pip3.11 install ansible",
      "ansible-pull -i localhost, -U https://github.com/hsompura2012-web/Practice-Ansible-template-V1.git main.yaml -e component=${each.key} -e env=${var.env}"

    ]
  }
}
