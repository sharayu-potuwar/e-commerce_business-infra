resource "aws_cloudwatch_log_group" "ecom_watch_gp" {
  name = "${var.env}_ecom_watch_gp"

  tags = {
    Environment = "staging"
    Application = "ecomm"
  }
}

resource "aws_cloudwatch_log_stream" "ecom_stream" {
  name           = "${var.env}_EcomLogStream"
  log_group_name = aws_cloudwatch_log_group.ecom_watch_gp.name
}