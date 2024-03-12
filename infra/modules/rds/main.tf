resource "aws_db_instance" "this" {
  db_name              = "db-${var.project_name}-${var.environment}"
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  manage_master_user_password = var.manage_master_user_password  #To manage password with Secrets Manager 
  parameter_group_name = var.parameter_group_name

# Storage Autoscaling
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
}