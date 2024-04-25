resource "aws_cloudwatch_log_group" "ecom_watch_gp" {
  name = "ecom_watch_gp"

  tags = {
    Environment = "staging"
    Application = "ecomm"
  }
}