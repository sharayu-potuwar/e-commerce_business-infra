# Create a new load balancer
resource "aws_elb" "ecom_elb" {
  name               = "aws-terraform-elb"
  availability_zones = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
  
  listener {
    instance_port     = 8001
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8001/"
    interval            = 30
  }
  
}
