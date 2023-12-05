variable "vpcs" {
  type = map(object({
    name                   = string,
    cidr                   = string,
    azs                    = list(string),
    private_subnets        = list(string),
    public_subnets         = list(string),
    enable_nat_gateway     = bool,
    single_nat_gateway     = bool,
    one_nat_gateway_per_az = bool,
  }))
}

variable "ec2s" {
  type = map(object({
    name                        = string,
    ami                         = string,
    instance_type               = string,
    associate_public_ip_address = bool
  }))
}