terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "afeef"
}
resource "aws_instance" "my_app" {
  ami           = "ami-0c7217cdde317cfec"  
  instance_type = "t2.micro"      
  key_name      = "A" 
  tags = {
    Name = "Node-App"
  }
}
resource "aws_security_group" "my_security_group" {
  name        = "MySecurityGroup"
  description = "Allow inbound traffic on port 3000"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]  
  }

  tags = {
    Name = "MySecurityGroup"
  }
}
