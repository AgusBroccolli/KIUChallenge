variable "project_name" {
  description = "Project cluster's name"
  type = string
}

variable "environment" {
  description = "Environment to deploy"
  type = string
}

variable "arn_role" {
  description = "ARN of the IAM role that provides permissions for the Kubernetes control plane"
  type = string
}

variable "subnet_ids" {
  description = "IDs for the subnets associated with the cluster"
  type = list(string)
}

variable "tags" {
  description = "Key-value map of cluster tags"
  type = map(string)
  default = {
    "project" = "KIU Challenge"
  }
}