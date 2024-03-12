variable "project_name" {
  description = "Project cluster's name"
  type        = string
}

variable "environment" {
  description = "Environment to deploy"
  type        = string
}

variable "subnet_ids" {
  description = "IDs for the subnets associated with the cluster"
  type        = list(string)
}

variable "tags" {
  description = "Key-value map of tags"
  type        = map(string)
}