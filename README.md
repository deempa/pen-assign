# pen-assign

## Overview
The goal of the project was to build three environments for each of the groups, environments isolated from each other, with the possibility to configure them in a different way according to demand (with the help of variables). In each of the environments, there is a different vpc and different network settings, a Windows machine, and s3 adjusted according to the name of the environment (basketball team in this case).
The goal is to allow each environment to access the s3 of the other environments in addition to the s3 intended for it.

## Prerequisites
Before you begin, ensure you have the following prerequisites:

* Terraform Installed: Make sure you have Terraform installed on your machine. You can download it from Terraform Downloads.

* AWS Credentials: Set up your AWS credentials with the necessary permissions. You can configure credentials using the AWS CLI (aws configure) or environment variables.

## Step-by-step instructions

1. Create AWS security credentials for programmatic access using access and secret key. (Via AWS console, IAM service)
2. run `aws configure` command and enter the details (access key, secret key, region(ex. eu-west-1), output format(ex. json))
3. clone this repo with the command - `git clone https://github.com/deempa/pen-assign.git`
4. cd to the repo folder.
5. Make sure Terraform version 1.6.* installed on your laptop.
6. `terraform init`
7. If you want, you have the ability to change variables values in the terraform.tfvars file
8. `terraform plan`
9. `terraform apply` and then type 'yes'
   This will deploy 3 vpc, with one public subnet in each, 3 windows server machine in each vpc(already installed aws cli on it), 3 keypairs each per ec2, 3 buckets, iam (policy and role for access to s3 bucket from ec2s), 3 security groups each per vpc to enable inbound access worldwide to rdp
10. `terraform output` will show you the public ips of each machine, as well each pem file to use to decrypt password and connect to the ec2 using rdp. `terraform output key_pairs_pem` will show you each pem content.
11. To rdp to the ec2s, login to the AWS console, go to ec2 service, select one instance and download his rdp file (Connect button) and decrypt the password using his pem file.
12. use remote desktop to connect to an instance.

