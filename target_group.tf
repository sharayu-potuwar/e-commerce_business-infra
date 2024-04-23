resource "aws_lb_target_group" "ecom_target" {
  name        = "tf-alb-tg"
  port        = 8001
  protocol    = "ip"
  vpc_id      = "vpc-05b1ca67a2465043e"
}