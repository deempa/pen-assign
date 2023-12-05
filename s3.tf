module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.15.1"

  for_each = var.ec2s

  bucket = "${each.value.name}-bucket"
}