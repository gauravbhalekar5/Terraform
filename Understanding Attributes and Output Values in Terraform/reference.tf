/*
provider "aws" {
    region = "us-east-1"
    access_key = "PUT-YOUR-ACCESS-KEY-HERE"
    secret_key = "PUT-YOUR-SECRET-KEY-HERE"
  
}

resource "aws_instance" "web" {
    ami = "ami-016eb5d644c333ccb"
    instance_type = "t2.micro"
  
}

resource "aws_eip" "add" {
    vpc = true  
}

resource "aws_eip_association" "assign" {
    instance_id = aws_instance.web.id
    allocation_id = aws_eip.add.id 
  
}

resource "aws_security_group" "allow_tls" {
    name = "evolenthealth"
    vpc_id = "vpc-0de010a8ff01473a0"
  
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["${aws_eip.add.public_ip}/32"]
  }
}*/



# Explanation on above code for other's reference:

# This is a Terraform code for provisioning and configuring resources in AWS. 
# The provider "aws" sets up an AWS provider using the access and secret keys located in the code. 
# A new EC2 instance is created using the "aws_instance" resource block. 
# The instance uses an Amazon Machine Image (AMI) and an instance type. After that, an Elastic IP address is created using the "aws_eip" resource block. 
# In addition, the Elastic IP address is associated with the EC2 instance using the "aws_eip_association" resource block. Finally, a security group is set up using the "aws_security_group" resource block. 
# This security group allows traffic over port 443 from the public IP address of the Elastic IP. 
# The security group is associated with the VPC specified by its ID.

# This code provisions resources in AWS through the provider aws. 
# It creates an EC2 instance (aws_instance) with type t2.micro
# and Amazon Machine Image (AMI) ami-00c39f71452c08778. 
# Then it defines an Elastic IP (aws_eip) with VPC enabled and associates it with the EC2 instance (aws_eip_association). 
# Finally, it creates a new security group (aws_security_group) named 'evolenthealth' and allows incoming traffic on port 443 from the public IP address of the Elastic IP. 

