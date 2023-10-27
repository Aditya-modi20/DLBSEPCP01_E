resource "aws_lb" "aws_load_balancer" {
  name = "elastic-load-balancer"
  load_balancer_type = "application"
  security_groups = ["sg-027275b707a68a01e"]
  subnets = ["subnet-06cbb291201d2be26","subnet-063fcd5d531b9d972"]

  tags = {
    name = "aws elastic load balancer"
  }
}

resource "aws_lb_target_group" "alb_target_group" {
  name = "aws-target-group"
  target_type = "instance"
  port = 80
  protocol = "HTTP"
  vpc_id = "vpc-0ef05830c36d35c9a"

  tags = {
    name = "target group"
  }
  health_check {

    port = 80
    interval = 90
    protocol = "HTTP"
    timeout = 30
    path = "/"

  }
  depends_on = [aws_lb.aws_load_balancer]
}

resource "aws_lb_listener" "aws_listener" {
  load_balancer_arn = aws_lb.aws_load_balancer.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}