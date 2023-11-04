terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  }


resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "default_vpc"
  }
}


