module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.2.0"

  for_each = var.vpcs

  name = "${each.value.name}-vpc"
  cidr = each.value.cidr

  azs             = each.value.azs
  private_subnets = each.value.private_subnets
  public_subnets  = each.value.public_subnets

  enable_nat_gateway     = each.value.enable_nat_gateway
  single_nat_gateway     = each.value.single_nat_gateway
  one_nat_gateway_per_az = each.value.one_nat_gateway_per_az

  tags = {
    Environment = "${each.value.name}-dev"
  }
}