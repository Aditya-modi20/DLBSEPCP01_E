variable ami {
  type = string
  default = "ami-08333bccc35d71140"
}

variable "region" {
  type = string
  default = "us-east-2"
  description = "default region"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "default instance"
}
variable "aws_region" {
  type = string
  default = "us-east-2"
  description = "default region"
}

