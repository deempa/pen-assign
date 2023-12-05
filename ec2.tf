module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  for_each = var.ec2s

  name = "${each.value.name}-instance"

  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  key_name                    = module.key_pair[each.key].key_pair_name
  vpc_security_group_ids      = [aws_security_group.allow_rdp[each.key].id]
  subnet_id                   = module.vpc[each.key].public_subnets[0]
  associate_public_ip_address = each.value.associate_public_ip_address
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.id
  user_data                   = <<-EOF
<script>
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi /qn
echo Current date and time >> %SystemRoot%\Temp\test.log
echo %DATE% %TIME% >> %SystemRoot%\Temp\test.log
</script>
EOF

  tags = {
    Environment = "${each.value.name}-dev"
  }
}