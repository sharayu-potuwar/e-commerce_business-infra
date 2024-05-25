resource "aws_cloudwatch_log_group" "ecom_watch_gp" {
  name = "ecom_watch_gp"
  tags = {
    Application = "ecom"
  }
}

resource "aws_cloudwatch_log_stream" "ecom_stream" {
    name           = "${var.env}_ecom_app_log_stream"
    log_group_name = aws_cloudwatch_log_group.ecom_watch_gp.name
}

resource "aws_cloudwatch_log_stream" "ecom_build_stream" {
    count = try(var.env == "dev" ?  1 : 0)
    name           = "build_log_stream"
    log_group_name = aws_cloudwatch_log_group.ecom_watch_gp.name
}
