variable "region" {
  description = "Region for Project"
  type = "string"
  default = "us-west-2"
}
variable "vpc_cidr" {
  description = "Main VPC cidr"
  type = "string"
  default = "10.20.0.0/16"
}

variable "tenancy" {
  default = "default"
}