resource "aws_security_group" "sg" {
  name = "sg"
  description = "security group"
  vpc_id = "vpc-0ef05830c36d35c9a"
  ingress  {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress{
    from_port = 443
    protocol  = "tcp"
    to_port   = 443
     cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg for subnets"
  }

}
