# data "aws_s3_object" "bucketreference" {
#   bucket = "ecom-email-sourcecode-bucket"
#   key    = "campaign_service.zip"
# }

# resource "aws_lambda_function" "ecom_lambda" {
#     s3_bucket         = data.aws_s3_object.bucketreference.bucket
#     s3_key            = data.aws_s3_object.bucketreference.key
#     s3_object_version = data.aws_s3_object.bucketreference.version_id
#     function_name     = "e-commerce_business-campaign-service"
#     role              = aws_iam_role.iam_for_lambda.arn # (not shown)
#     handler           = "welcome-mail.lambda_handler"
#     runtime           = "python3.10"
# }


