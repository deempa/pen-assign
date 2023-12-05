module "key_pair" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = "2.0.2"

  for_each = var.ec2s

  key_name           = "${each.key}-key"
  create_private_key = true
}