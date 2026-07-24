resource "aws_vpc" "name" {
    cidr_block = var.CIDR
    region = var.Region
    tags = {
        Name = var.tags-VPC
    }
}
