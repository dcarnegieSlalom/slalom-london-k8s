provider "aws" {
  region      = "eu-west-1"
  profile     = "slalom"
}

terraform {
  backend "s3" {
    bucket = "slalom-k8s-terraform"
    key    = "prereqs/terraform.tfstate"
    region = "eu-west-1"
    profile = "slalom"
  }
}
