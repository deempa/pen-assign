# Pen-Assign: Multi-Environment Deployment with Terraform

## Overview
The Pen-Assign project aims to create three isolated environments, each tailored for a specific group, configurable through variables. Each environment consists of a unique Virtual Private Cloud (VPC), distinct network settings, a Windows machine, and an S3 bucket named after the corresponding basketball team.

The primary objective is to enable inter-environment S3 access, allowing each environment to interact with the S3 buckets of other environments, along with its dedicated S3 bucket.

## Prerequisites
Before you begin, ensure you have the following prerequisites:

- **Terraform Installed:** Download and install Terraform from [Terraform Downloads](https://www.terraform.io/downloads.html).

- **AWS CLI Installed:** Download and install AWS CLI tool [AWS docs](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- **AWS Credentials:** Set up AWS credentials with the necessary permissions. Configure credentials using the AWS CLI (`aws configure`) or environment variables.


## Step-by-step Instructions

1. **Create AWS Security Credentials:**
   - Generate programmatic access credentials via the AWS console's IAM service.

2. **Configure AWS CLI:**
   - Run `aws configure` and enter the access key, secret key, region (e.g., eu-west-1), and output format (e.g., json).

3. **Clone Repository:**
   - Clone the repository using the command:
     ```bash
     git clone https://github.com/deempa/pen-assign.git
     ```

4. **Navigate to Repository:**
   - Change to the repository folder:
     ```bash
     cd pen-assign
     ```

5. **Ensure Terraform Version:**
   - Confirm that Terraform version 1.6.* is installed on your machine.

6. **Initialize Terraform:**
   - Run:
     ```bash
     terraform init
     ```

7. **Optional: Modify Variables:**
   - Optionally, adjust variable values in the `terraform.tfvars` file.

8. **Plan Deployment:**
   - Run:
     ```bash
     terraform plan
     ```

9. **Apply Deployment:**
   - Run:
     ```bash
     terraform apply
     ```
     Type 'yes' when prompted. This deploys 3 VPCs, each with a public subnet, 3 Windows server machines, key pairs, S3 buckets, IAM policies and roles, and security groups.

10. **View Outputs:**
    - Retrieve public IPs and PEM content:
      ```bash
      terraform output ec2s_public_ips
      terraform output key_pairs_pem
      ```

11. **RDP Access:**
    - To RDP into an EC2 instance:
      - Login to the AWS console, navigate to the EC2 service.
      - Select an instance, click 'Connect,' and download the RDP file.
      - Decrypt the password using the corresponding PEM file.

12. **Remote Desktop Connection:**
    - Use a remote desktop client to connect to the EC2 instance.

13. **Delete Envs:** 
    - Run:
    ```bash
    terraform destroy
    ```
    Type 'yes' when prompted. This will destroy all the resources we deployed earlier.


## Additional Information

- **Windows 10 AMI:** To use a Windows 10 AMI, you can either upload a VHD image of Windows 10 to an S3 bucket and create an AMI from it (considering licensing), or utilize Amazon Workspaces.

- **Network:** Deploying only one public subnet and zero private subnets is a cost-effective decision for a test environment, avoiding additional costs associated with NAT Gateway.

- **Modules:** The project employs various modules to enhance code cleanliness and eliminate redundancy. These modules adhere to high standards maintained by their respective owners.

- **State File:** While the best practice is to store the state file in a backend (e.g., S3 bucket), for this project, it is saved locally within the folder.

- **Tfvars:** Normally, tfvars should not be saved in the Git repo. For the purpose of this exam, the gitignore for this file has been removed, and it will be uploaded to the Git repo.