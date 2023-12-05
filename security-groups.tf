resource "aws_security_group" "allow_rdp" {
  for_each    = var.vpcs
  name        = "allow_rdp"
  description = "Allow RDP inbound traffic"
  vpc_id      = module.vpc[each.key].vpc_id

  ingress {
    description = "RDP from internet"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_rdp"
  }
}