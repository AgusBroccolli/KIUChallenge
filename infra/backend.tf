module "s3" {
  source = "./modules/s3"

  bucket_name = "tf-states"
  tags        = var.tags
}

terraform {
  backend "s3" {
    bucket = "tf-states"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}