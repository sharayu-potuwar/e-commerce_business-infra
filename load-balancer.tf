resource "aws_lb" "ecom_lb" {
  name               = "${var.env}-ecom-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-0070f32bfa40490c2"]
  subnets            = ["subnet-005a5c83ac0837b4f","subnet-0e82b9017f47c921a"]

  tags = {
    Environment = "${var.env}"
  }
}

resource "aws_lb_target_group" "ecom_ip-tg-blue" {
  name        = "${var.env}-ecom-tg-blue"
  port        = 8001
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = "vpc-05b1ca67a2465043e"
}

resource "aws_lb_target_group" "ecom_ip-tg-green" {
  name        = "${var.env}-ecom-tg-green"
  port        = 8002
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = "vpc-05b1ca67a2465043e"
}

resource "aws_lb_listener" "ecom_listener" {
  load_balancer_arn = aws_lb.ecom_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecom_ip-tg-blue.arn
  }
}
