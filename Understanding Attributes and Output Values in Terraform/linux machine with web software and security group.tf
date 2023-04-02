provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

# Spin up EC2 Instance here

resource "aws_instance" "linux" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"

  user_data = filebase64("${path.module}/script.sh")

  vpc_security_group_ids = ["${aws_security_group.evolent_sg.id}"]
  # security_groups = ["${aws_security_group.evolent_sg.name}"]

  tags = {
    Name = "webserver"
  }

}

# Creating Security Group for EC2

resource "aws_security_group" "evolent_sg" {
  name        = "evolent_sg"
  description = "example of evolent security group"
  vpc_id      = "vpc-0de010a8ff01473a0"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "evolent_sg"
  }

}

