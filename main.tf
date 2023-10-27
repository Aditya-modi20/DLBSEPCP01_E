terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  }
provider "aws" {
  region = "us-east-2"
   access_key = ["your access key"]
  secret_key = ["your security keys"]

  }

/*resource "aws_instance" "Myinstance" {
  ami = "ami-08333bccc35d71140"
  instance_type = "t2.micro"
  key_name = "keypair"
  vpc_security_group_ids = ["sg-027275b707a68a01e"]
  user_data = file("data.sh")

  tags = {
    Name = "Myinstance"
  }
} */

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "default_vpc"
  }
}


