resource "aws_lb" "ecom_lb" {
  name               = "ecom-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-0070f32bfa40490c2"]
  subnets            = ["subnet-005a5c83ac0837b4f","subnet-0e82b9017f47c921a"]

  tags = {
    Environment = "staging"
  }
}

resource "aws_lb_target_group" "ecom_ip-tg" {
  name        = "ecom-lb-tg"
  port        = 8001
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = "vpc-05b1ca67a2465043e"
}

