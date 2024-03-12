module "kiu-eks" {
  source = "./modules/eks"

  project_name = var.project_name
  environment  = var.environment
  subnet_ids   = var.subnet_ids

  arn_role = "arn:aws:iam::123456789012:role/cluster-role"

}