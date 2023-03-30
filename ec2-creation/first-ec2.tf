terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"

}

resource "aws_instance" "MyEC2" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"

}


# Versioning
# version    = "2.7"
# version    = ">= 2.8"
# version    = "<= 2.8"
# version    = ">=2.10,<=2.30"

# The code uses Terraform to provision an EC2 instance on AWS. It uses version 4.0 of the HashiCorp AWS provider. The region is set to us-east-1 and the AWS access key and secret key are provided for authentication. The EC2 instance's ID will be "MyEC2" and it uses an Amazon Machine Image (AMI) with ID ami-00c39f71452c08778 and an instance type of t2.micro. 