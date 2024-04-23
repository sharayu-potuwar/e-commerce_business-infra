# Create a new load balancer
resource "aws_elb" "ecom_elb" {
  name               = "aws-terraform-elb"
  availability_zones = [ "us-east-1a", "us-east-1b", "us-east-1c" ]

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

#   listener {
#     instance_port      = 8000
#     instance_protocol  = "http"
#     lb_port            = 443
#     lb_protocol        = "https"
#     ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
#   }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }
  
#   instances                   = [aws_instance.foo.id]
#   cross_zone_load_balancing   = true
#   idle_timeout                = 400
#   connection_draining         = true
#   connection_draining_timeout = 400

  tags = {
    Name = "foobar-terraform-elb"
  }
}

# resource "aws_load_balancer_policy" "wu-tang-ssl-tls-1-1" {
#   load_balancer_name = aws_elb.ecom_elb
#   policy_name        = ""
#   policy_type_name   = ""

#   policy_attribute {
#     name  = "Reference-Security-Policy"
#     value = "ELBSecurityPolicy-TLS-1-1-2017-01"
#   }
# }