 resource "aws_lb" "ecom_alb" {
  name               = "ecom-lb-tf"
  internal           = false
  load_balancer_type = "application"
}