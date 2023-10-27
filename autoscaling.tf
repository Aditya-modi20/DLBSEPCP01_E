resource "aws_launch_template" "launch_template" {
  name = "launch_template"
  image_id = "ami-08333bccc35d71140"
  instance_type = "t2.micro"
  key_name = "keypair"
  vpc_security_group_ids = ["sg-027275b707a68a01e"]
  user_data = base64encode(file("data.sh"))
}

resource "aws_autoscaling_group" "auto_scale" {
  name = "auto_scale"
  availability_zones = ["us-east-2a", "us-east-2b"]
  desired_capacity = 1
  max_size = 4
  min_size = 1
  health_check_grace_period = 300
  health_check_type = "ELB"
  depends_on = [aws_lb.aws_load_balancer]
  target_group_arns = [aws_lb_target_group.alb_target_group.arn]

  launch_template {
    id = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "aws_auto_scaling_attachment" {
  autoscaling_group_name = aws_autoscaling_group.auto_scale.id
  lb_target_group_arn = aws_lb_target_group.alb_target_group.arn
}

resource "aws_autoscaling_policy" "aws_autoscaling_policy" {
  autoscaling_group_name = aws_autoscaling_group.auto_scale.name
  name  = "auto_scale"
  policy_type = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 70
  }
}