terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  shared_credentials_files = ["/root/.aws/credentials"]
  region = var.region
  #   access_key = var.access_key
  #   secret_key = var.secret_key
}
