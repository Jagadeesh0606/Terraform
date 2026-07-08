resource "aws_vpc" "dev" {
    cidr_block = var.cidr_block
    tags ={
        Name = var.tag
    }
  
}

resource "aws_subnet" "name" {
    vpc_id = aws_vpc.dev.id
    cidr_block = var.cidr_block_subnet
    tags = {
        Name = var.tag_subnet
    }
  
}
