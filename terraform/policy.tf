# resource "aws_iam_policy" "ecr-policy" {
#   name        = "${var.env}_ecr_policy"
#   path        = "/"
#   description = "My ecr policy"
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       { 
#         Action = [
#                 "ecr:BatchGetImage",
#                 "ecr:GetDownloadUrlForLayer",
#                 "ecr:GetAuthorizationToken"
#         ]
#         Effect   = "Allow"
#         Resource= "*"
#       }
#     ]
#   })
# }

# resource "aws_iam_policy" "sns-policy" {
#   name        = "${var.env}_sns_policy"
#   path        = "/"
#   description = "My sns policy"
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       { 
#         Action = [
#                 "SNS:Publish"
#         ]
#         Effect   = "Allow"
#         Resource= "*"
#       }
#     ]
#   })
# }

# resource "aws_iam_policy" "secret-policy" {
#   name        = "${var.env}_secret_policy"
#   path        = "/"
#   description = "My secret policy"
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       { 
#         Action   = ["secretsmanager:GetSecretValue","kms:Encrypt","kms:Decrypt"]
#         Effect   = "Allow"
#         Resource= "*"
#       }
#     ]
#   })
# }

# resource "aws_iam_policy" "cloudwatch-policy" {
#   name        = "${var.env}_cloudwatch_policy"
#   path        = "/"
#   description = "My cloudwatch policy"
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       { 
#         Action   = ["logs:CreateLogStream","logs:PutLogEvents","logs:CreateLogGroup"]
#         Effect   = "Allow"
#         Resource= "*"
#       }
#     ]
#   })
# }



# resource "aws_iam_role_policy_attachment" "ecs-task-role-policy-attachment" {
#   role      = aws_iam_role.ecs_task_role.name
#   policy_arn = aws_iam_policy.sns-policy.arn
# }

# resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment" {
#   role      = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = aws_iam_policy.ecr-policy.arn
# }

# resource "aws_iam_role_policy_attachment" "ecs-task-cloudwatch-execution-role-policy-attachment" {
#   role      = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = aws_iam_policy.cloudwatch-policy.arn
# }

# resource "aws_iam_role_policy_attachment" "ecs-task-secretsmanager-role-policy-attachment" {
#   role = aws_iam_role.ecs_task_role.name
#   policy_arn = aws_iam_policy.secret-policy.arn
# }