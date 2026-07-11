resource "aws_vpc" "dev" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "dev_subnet" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = var.subnet_name
  }
}