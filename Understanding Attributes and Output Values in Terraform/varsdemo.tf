/*
provider "aws" {
    region = "us-east-1"
    access_key = "PUT-YOUR-ACCESS-KEY-HERE"
    secret_key = "PUT-YOUR-SECRET-KEY-HERE" 
  
}

resource "aws_security_group" "var-demo" {
  name = "evolent"

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [var.vpn_ip]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.vpn_ip]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [var.vpn_ip]
  }
}*/

/*
This code uses the AWS provider to create a security group named "evolent". 
This security group allows inbound traffic on ports 443, 80 and 8080 from a specific IP address provided in a variable called "vpn_ip". 
The AWS provider is configured with the access and secret keys to access resources in the us-east-1 region.

This is a Terraform configuration file for the AWS provider. It sets the region to "us-east-1" and authenticates with access and secret keys.
It creates an AWS security group resource named "var-demo" with three ingress rules. Each ingress rule specifies a port range, a transport protocol (TCP), and a CIDR block to allow traffic from (specified here as a variable called "vpn_ip").
The first rule permits inbound traffic on port 443 (HTTPS), the second on port 80 (HTTP), and the third permits inbound traffic on port 8080. All inbound traffic is restricted to the CIDR block specified in the variable "vpn_ip".
*/
