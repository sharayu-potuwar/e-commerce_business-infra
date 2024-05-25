resource "aws_ecr_repository" "ecom_repo" {
  count = try(var.env == "dev" ?  1 : 0)
  name = "ecom_repo"          # Name of the repository
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}



# # resource "aws_ecr_lifecycle_policy" "ecom_repo_policy" {
# #   repository = aws_ecr_repository.ecom_repo[0].name
# #   policy = jsonencode({
# #    rules = [{
# #      rulePriority = 1
# #      description  = "keep last 10 images"
# #      action       = {
# #        type = "expire"
# #      }
# #      selection     = {
# #        tagStatus   = "any"
# #        countType   = "imageCountMoreThan"
# #        countNumber = 10
# #      }
# #    }]
# #   })
# # }
