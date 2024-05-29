# Application Logs
resource "aws_cloudwatch_log_group" "ecom_watch_gp" {
    name = "${var.env}_ecom_watch_gp"
    tags = {
        Application = "ecom"
    }
}

resource "aws_cloudwatch_log_stream" "ecom_stream" {
    name           = "${var.env}_ecom_app_log_stream"
    log_group_name = aws_cloudwatch_log_group.ecom_watch_gp.name
}

# Build Logs
resource "aws_cloudwatch_log_group" "ecom_build_gp" {
    count = try(var.env == "dev" ?  1 : 0)
    name = "ecom_build_watch_gp"
}

resource "aws_cloudwatch_log_stream" "ecom_build_stream" {
    count = try(var.env == "dev" ?  1 : 0)
    name           = "ecom_build_log_stream"
    log_group_name = aws_cloudwatch_log_group.ecom_build_gp[0].name
}

# lamnbda logs /aws/lambda/${var.lambda_function_name}
resource "aws_cloudwatch_log_group" "lambda_watch_gp" {
    name = "/aws/lambda/${var.lambda_function_name}"
    tags = {
        Application = "ecom"
    }
}