resource "aws_vpc" "name" {
    cidr_block = var.cidr_block
    tags = {
        Name = var.vpc_name
    }
  
}

resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.availability_zone
    tags = {
        Name = var.subnet_name
    }
}

resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.name.id
    associate_public_ip_address = true

    tags = {
        Name = var.instance_name
    }
}