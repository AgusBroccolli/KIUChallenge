variable "project_name" {
  description = "Project cluster's name"
  type = string
}

variable "environment" {
  description = "Environment to deploy"
  type = string
}

variable "engine" {
  description = "The database engine to use"
  type = string
}

variable "engine_version" {
  description = "The engine version to use"
  type = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type = string
}

variable "username" {
  description = "Username for the master DB user"
  type = string
  default = "admin"
}

variable "manage_master_user_password" {
  description = "Boolean to set the master user password in Secrets Manager"
  type = bool
  default = true
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  type = string
}

variable "allocated_storage" {
  description = "The allocated storage in gibibytes"
  type = number
}

variable "max_allocated_storage" {
  description = "The upper limit to scale the storage of the DB instance"
  type = number
}