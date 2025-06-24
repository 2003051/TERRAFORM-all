
# 🚀 Terraform AWS Project: EC2 + S3 + DynamoDB + Remote Backend

This project provisions an AWS EC2 instance, S3 bucket, and DynamoDB table using Terraform. 
It also configures remote state storage using S3 and state locking via DynamoDB.
This Terraform project demonstrates the use of Infrastructure as Code (IaC) to automate the provisioning and management of cloud resources on AWS. Terraform allows users to define infrastructure in human-readable configuration files that can be version-controlled and reused. In this project, an EC2 instance is provisioned to simulate a virtual machine in the cloud, which can be used to host applications or services. An S3 bucket is created to serve as remote storage for the Terraform state file, which keeps track of the infrastructure managed by Terraform. Storing state remotely enables collaboration and consistency across teams. To ensure safe and concurrent operations, a DynamoDB table is also configured for state locking, which prevents multiple users from making conflicting changes to the infrastructure at the same time. Additionally, this project uses Terraform’s backend configuration to link the S3 bucket and DynamoDB table with state management, providing a secure and reliable way to manage infrastructure at scale. This setup reflects best practices for using Terraform in production environments.


## 📁 Project Structure


.
├── main.tf            # AWS resources: EC2, S3, DynamoDB
├── backend.tf         # Remote backend using S3 & DynamoDB
├── providers.tf       # Terraform and AWS provider version config
├── variables.tf       # Input variables for configuration
├── outputs.tf         # Output values for deployed resources
├── terraform.tfvars   # Actual values for input variables
├── .gitignore         # Files ignored by Git
└── README.md          # Project documentation




## 🔧 Resources Created

| Resource       | Description                         |
| -------------- | ----------------------------------- |
| EC2 Instance   | A `t2.micro` EC2 instance           |
| S3 Bucket      | Stores Terraform state remotely     |
| DynamoDB Table | Manages state locking for Terraform |



## 🗺️ Architecture Diagram


+--------------------------+
|     Terraform Client     |
|  (Your local environment)|
+------------+-------------+
             |
             v
+--------------------------+
|        AWS Cloud         |
+--------------------------+
| - EC2 Instance           |
| - S3 Bucket (state)      |
| - DynamoDB (state lock)  |
+--------------------------+


How to Use This Project

### 1. ✅ Prerequisites

* [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
* AWS CLI configured with proper credentials:

  aws configure
  

### 2. ⚙️ Initialize Terraform

terraform init

### 3. 🔍 Review the Plan

terraform plan

### 4. 🚀 Apply Infrastructure

terraform apply

### 5. 🔥 Destroy Infrastructure

terraform destroy

## 📦 Input Variables (`variables.tf`)

| Name         | Description                        | Example Value                |
| ------------ | ---------------------------------- | ---------------------------- |
| region       | AWS region                         | `"us-east-1"`                |
| ami\_id      | AMI ID for EC2 instance            | `"ami-053b0d53c279acc90"`    |
| subnet\_id   | Subnet ID to launch instance       | `"subnet-019ea91ed9b5252e7"` |
| bucket\_name | Name of S3 bucket for remote state | `"gouri-s3-demo-xyz"`     |



## 📤 Outputs (`outputs.tf`)

| Output       | Description                    |
| ------------ | ------------------------------ |
| instance\_id | ID of the created EC2 instance |
| bucket\_name | Name of the created S3 bucket  |



## 🔐 IAM Policy Example

Here is a sample IAM policy with minimal permissions (adjust as needed):

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:*",
        "s3:*",
        "dynamodb:*"
      ],
      "Resource": "*"
    }
  ]
}





