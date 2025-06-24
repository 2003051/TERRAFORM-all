output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.abhishek.id
}

output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.id
}
