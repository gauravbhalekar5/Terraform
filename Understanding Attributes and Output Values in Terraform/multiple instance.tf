provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA25K3JIFQ5SHRZGE5"
  secret_key = "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"
}

variable "different_name" {
  type    = list(any)
  default = ["dev-webserver", "stage-webserver", "prod-webserver"]
}

resource "aws_instance" "multiple" {
  count         = 3
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"

  tags = {
    Name = var.different_name[count.index]
  }
}

#This code is using Terraform to create three AWS EC2 instances in the us-east-1 region. 
#The code specifies the access and secret keys to authenticate with the AWS provider using an access key ID and a secret access key. The code also creates a Terraform variable of type list with three strings, and then uses that variable to tag the instances with different names. Lastly this code defines three instances with the AMI ami-00c39f71452c08778 using an instance type of t2.micro.