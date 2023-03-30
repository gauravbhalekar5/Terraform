provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"

}

resource "aws_eip" "lb" {
  vpc = true

}

output "eip" {
  value = aws_eip.lb.public_ip

}

resource "aws_s3_bucket" "mys3" {
  bucket = "evolent-bucket"

}

output "s3_bucket" {
  value = aws_s3_bucket.mys3.bucket_domain_name

}


# The following code is using the Terraform AWS provider to create AWS Elastic IP and S3 Bucket. The provider block is used to configure the connection to the AWS region, access key, and secret key. 
# The AWS_EIP resource specifies a new Elastic IP with VPC attribute set to true. 
# The output block is specifying that the Elastic IP created should be returned, with the format aws_eip.lb.public_ip. 
# AWS_S3_BUCKET resource is being created with a specified bucket name. 
# The output block is specifying that the S3 bucket domain name should be returned in the following format, aws_s3_bucket.mys3.bucket_domain_name.
