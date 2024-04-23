resource "aws_lb_target_group" "ecom_target" {
  name        = "tf--alb-tg"
  target_type = "alb"
  port        = 80
  protocol    = "http"
  vpc_id      = "vpc-05b1ca67a2465043e"
}