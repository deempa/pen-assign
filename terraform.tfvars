vpcs = {
  "Maccabi TA" = {
    name                   = "maccabi-ta",
    cidr                   = "10.0.0.0/16",
    azs                    = ["eu-west-1a", "eu-west-1b"],
    private_subnets        = [],
    public_subnets         = ["10.0.2.0/24"],
    enable_nat_gateway     = false
    single_nat_gateway     = false
    one_nat_gateway_per_az = false
  },
  "Hapoel JR" = {
    name                   = "hapoel-jr",
    cidr                   = "10.1.0.0/16",
    azs                    = ["eu-west-1a", "eu-west-1b"],
    private_subnets        = [],
    public_subnets         = ["10.1.2.0/24"],
    enable_nat_gateway     = false
    single_nat_gateway     = false
    one_nat_gateway_per_az = false
  },
  "Bnei Herzelia" = {
    name                   = "bnei-herzelia",
    cidr                   = "10.2.0.0/16",
    azs                    = ["eu-west-1a", "eu-west-1b"],
    private_subnets        = [],
    public_subnets         = ["10.2.2.0/24"],
    enable_nat_gateway     = false
    single_nat_gateway     = false
    one_nat_gateway_per_az = false
  }
}

ec2s = {
  "Maccabi TA" = {
    name                        = "maccabi-ta",
    ami                         = "ami-0b3a63a48e767cc82",
    instance_type               = "t2.micro",
    associate_public_ip_address = true
  },
  "Hapoel JR" = {
    name                        = "hapoel-jr",
    ami                         = "ami-0b3a63a48e767cc82",
    instance_type               = "t2.micro",
    associate_public_ip_address = true
  },
  "Bnei Herzelia" = {
    name                        = "bnei-herzelia",
    ami                         = "ami-0b3a63a48e767cc82",
    instance_type               = "t2.micro",
    associate_public_ip_address = true
  }
}