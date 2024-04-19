resource "aws_ecr_repository" "ecom_repo" {
  name = "ecom_repo"          # Name of the repository
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}