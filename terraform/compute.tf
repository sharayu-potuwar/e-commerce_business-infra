data "aws_s3_object" "bucketreference" {
  bucket = "ecom-email-sourcecode-bucket"
  key    = "campaign_service.zip"
}

resource "aws_lambda_function" "ecom_lambda" {
    s3_bucket         = data.aws_s3_object.bucketreference.bucket
    s3_key            = data.aws_s3_object.bucketreference.key
    s3_object_version = data.aws_s3_object.bucketreference.version_id
    function_name     = "${var.env}-e-commerce_business-campaign-service"
    role              = aws_iam_role.iam_for_lambda.arn # (not shown)
    handler           = "campaign_service/welcome-mail.lambda_handler"
    runtime           = "python3.9"

    depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.lambda_watch_gp,
  ]
}

#Allow execution from SNS to lambda
resource "aws_lambda_permission" "with_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ecom_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.ecom-sns.arn
} 


