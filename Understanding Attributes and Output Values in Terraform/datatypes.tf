# datatypes.tf

provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

resource "aws_elb" "bar" {
  name               = var.elb_name
  availability_zones = var.az

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = var.timeout
  connection_draining         = true
  connection_draining_timeout = var.timeout

  tags = {
    Name = "foobar-terraform-elb"
  }
}





# variable.tf

variable "usernumber" {
  type = number
}

variable "elb_name" {
  type = string
  
}

variable "az" {
  type = list
  
}

variable "timeout" {
  type = number
  
}



# terraform.tfvars

elb_name = "evolentload"
az = ["us-west-2a", "us-west-2b", "us-west-2c"]
timeout = 400
