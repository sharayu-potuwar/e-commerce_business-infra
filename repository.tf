resource "aws_ecr_repository" "my_ecr_repo" {
  name = "my-ecr-repo"          # Name of the repository
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
