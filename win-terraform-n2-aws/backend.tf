# Stores the Terraform state file into S3.

terraform {
  backend "s3" {
    bucket = "terraform-state-wd40"
    key    = "terraform/win-terraform-n2-aws"
  }
}
