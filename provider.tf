terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.74.2"
    }
  }
}

provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  region = var.region
  #   access_key = var.access_key
  #   secret_key = var.secret_key
}
