resource "aws_ecr_repository" "repo" {
  name                 = "e-commerce-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

data "aws_iam_policy_document" "policy_doc" {
  statement {
    sid    = "allowecs"
    effect = "Allow"
    principals {
        type = "service"
        identifiers = ["ecs.amazonaws.com"]
    }
    actions = [
        "ecr:BatchGetImage",
        "ecr:GetDownloadUrlForLayer",
        "ecr:GetAuthorizationToken"
    ]
    resources = [
        "arn:aws:ecr:::*"
    ]
  }
}

resource "aws_ecr_repository_policy" "repo_policy" {
  repository = aws_ecr_repository.repo.name
  policy     = data.aws_iam_policy_document.policy_doc.json
}