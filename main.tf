resource "aws_instance" "abhishek" {
  ami           = var.ami_id
  subnet_id     = var.subnet_id
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
