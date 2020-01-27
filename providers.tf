provider "aws" {
  region = "${var.region}"
}
terraform {
  backend "s3" {
    bucket = "devopsterra"
    key = "terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "terrastatelock"
    encrypt = true
  }
}