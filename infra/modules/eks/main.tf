resource "aws_eks_cluster" "this" {
  name     = "eks-${var.project_name}-${var.environment}"
  role_arn = var.arn_role

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  tags = var.tags
}