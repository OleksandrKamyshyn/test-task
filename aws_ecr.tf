resource "aws_ecr_repository" "app" {
  name                 = "warp-repo"
  image_scanning_configuration {
    scan_on_push = true
  }
  image_tag_mutability = "MUTABLE"
}
