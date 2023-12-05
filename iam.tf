resource "aws_iam_policy" "s3_policy" {
  name        = "read_and_write_s3"
  description = "Policy that can read and write s3 buckets"
  policy      = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": ${jsonencode(values(module.s3_bucket)[*].s3_bucket_arn)}
    },
    {
      "Action": [
        "s3:*Object"
      ],
      "Effect": "Allow",
      "Resource" : ${jsonencode([for arn in values(module.s3_bucket)[*].s3_bucket_arn : "${arn}/*"])}
    }
  ]
}
EOT
}

module "iam_assumable_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

  version = "5.32.0"

  create_role = true
  role_name   = "ec2_to_s3_role"
  custom_role_policy_arns = [
    aws_iam_policy.s3_policy.arn
  ]
  trusted_role_services = [
    "ec2.amazonaws.com"
  ]

  role_requires_mfa = false

  depends_on = [aws_iam_policy.s3_policy]
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_instance_profile"
  role = module.iam_assumable_role.iam_role_name
}