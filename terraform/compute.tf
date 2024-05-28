resource "aws_lambda_function" "ecom_lambda" {
    function_name     = "EcomRegistraionMail"
    role              = aws_iam_role.iam_for_lambda.arn # (not shown)
    handler       = "email.lambda_handler"
    runtime = "python3.10"
}
