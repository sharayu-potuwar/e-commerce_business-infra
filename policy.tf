resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "ecs-task-role-policy-attachment" {
  role = aws_iam_role.ecs_task_role.name
  policy_arn = aws_iam_policy.ecr-policy.arn
}

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
         "Sid":"AllowPull",
         "Effect":"Allow",
         "Principal":{
            "Service":"ecs-tasks.amazonaws.com"
         }
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
        Resource = "211125373436.dkr.ecr.us-east-1.amazonaws.com/ecom_repo/*"
      }
    ]
  })
}

resource "aws_ecr_repository_policy" "policy" {
  repository = aws_ecr_repository.ecom_repo.name
  policy = aws_iam_policy.ecr-policy.policy
  
}