variable "region" {
  description = "AWS region to deploy resources in"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
}

variable "subnet_id" {
  description = "Subnet ID to launch the EC2 instance"
}

variable "bucket_name" {
  description = "Name of the S3 bucket for remote state"
}
