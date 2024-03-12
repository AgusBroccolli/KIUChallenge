variable "bucket_name" {
  description = "Bucket name"
  type = string
}

variable "tags" {
  description = "Key-value map of bucket tags"
  type = map(string)
  default = {
    "project" = "KIU Challenge"
  }
}