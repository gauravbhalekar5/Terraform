provider "aws" {
  region = "us-west-2"
  access_key = "AKIA25K3JIFQ67UWXKXQ"
  secret_key = "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"
}

resource "aws_instance" "MyEC2" {
    ami = "ami-0efa651876de2a5ce"
    instance_type = "t2.micro"
  
}