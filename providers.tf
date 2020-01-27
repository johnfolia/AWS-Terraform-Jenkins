provider "aws" {
  region = "${var.region}"
}
terraform {
  backend "s3" {
    bucket = "kamsdevops"
    key = "terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "terraformlock"
    encrypt = true
  }
}