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




user_data = filebase64("${path.module}/script.sh") Explanation as below 
In simple terms, this line of code is used to read the contents of a file named my_script.sh and convert it into a special format that can be understood by the EC2 instance during its creation.

Let me break it down further:

filebase64(): This is a function in Terraform that reads the content of a file and converts it into base64 format. Base64 is a method of encoding data that allows it to be safely transmitted between systems.
"${path.module}/my_script.sh": This is the file path of the script we want to read. ${path.module} is a Terraform variable that points to the directory where the current Terraform configuration file is located. By combining it with /my_script.sh, we get the full path to the my_script.sh file.
So, when Terraform processes this line, it reads the contents of the my_script.sh file, converts it into base64 format, and includes it in the EC2 instance configuration as user_data. The EC2 instance then uses this data to run the script when it is created.
    
 
  
 vpc_security_group_ids = ["${aws_security_group.evolent_sg.id}"] Explanation as below
 In simple words, vpc_security_group_ids is a property of the EC2 instance resource that specifies which security groups should be associated with the instance.

["${aws_security_group.evolent_sg.id}"] is a list containing a single item: the ID of the security group named "evolent_sg" that was created in the Terraform configuration. This means that the EC2 instance will be associated with the "evolent_sg" security group.
