terraform {
  backend "s3" {
    bucket         = "mohitqwe"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "lock-table-tf"
    shared_credentials_file = "~/.aws/credentials"
  }
}
