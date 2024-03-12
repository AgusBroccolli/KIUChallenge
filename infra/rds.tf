module "rds" {
  source = "./modules/rds"

  project_name = var.project_name
  environment  = var.environment

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  username                    = "admin"
  manage_master_user_password = true

  parameter_group_name = "default.mysql8.0"

  allocated_storage     = 30
  max_allocated_storage = 100

}