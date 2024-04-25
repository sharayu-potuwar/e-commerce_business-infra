resource "aws_iam_policy" "ecr-policy" {
  name        = "ecr_policy"
  path        = "/"
  description = "My ecr policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      { 
        Action = [
                "ecr:BatchGetImage",
                "ecr:GetDownloadUrlForLayer",
                "ecr:GetAuthorizationToken"
        ]
        Effect   = "Allow"
        Resource= "*"
      }
    ]
  })
}

resource "aws_iam_policy" "sns-policy" {
  name        = "sns_policy"
  path        = "/"
  description = "My sns policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      { 
        Action = [
                "SNS:Publish"
        ]
        Effect   = "Allow"
        Resource= "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs-task-role-policy-attachment" {
  role      = aws_iam_role.ecs_task_role.name
  policy_arn = aws_iam_policy.sns-policy.arn
}

resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment" {
  role      = aws_iam_role.ecs_task_execution_role.name
  policy_arn = aws_iam_policy.ecr-policy.arn
}
