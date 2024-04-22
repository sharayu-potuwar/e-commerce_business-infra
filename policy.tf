resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment" {
  role      = aws_iam_role.ecs_task_execution_role.name
  policy_arn = aws_iam_policy.ecr-policy.arn
  # policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# resource "aws_iam_role_policy_attachment" "ecs-task-role-policy-attachment" {
#   role = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = aws_iam_policy.ecr-policy.arn
# }

resource "aws_iam_policy" "ecr-policy" {
  name        = "ecr_policy"
  path        = "/"
  description = "My ecr policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      { 
        Action = [
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:CompleteLayerUpload",
                "ecr:GetDownloadUrlForLayer",
                "ecr:InitiateLayerUpload",
                "ecr:PutImage",
                "ecr:UploadLayerPart"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:ecr:us-east-1:211125373436:repository/ecom_repo"
      },
      {
            "Action": "ecr:GetAuthorizationToken",
            "Resource": "*",
            "Effect": "Allow"
      }
    ]
  })
}
