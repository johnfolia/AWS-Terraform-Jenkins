resource "aws_vpc" "my_app" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags = {
    Name = "${terraform.workspace}-DevOpsVpc"

  }
}