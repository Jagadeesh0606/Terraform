resource "aws_vpc" "name" {
    cidr_block = var.cidr_block
    tags = {
        Name = var.vpc_name
    }
  
}

resource "aws_security_group" "name" {
  vpc_id = aws_vpc.name.id
  name   = var.security_group_name

  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.ingress_protocol
    cidr_blocks = [var.ingress_cidr_block]
  }

  ingress {
    description = "HTTP"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = var.ingress_protocol
    cidr_blocks = [var.ingress_cidr_block]
  }

  ingress {
    description = "HTTPS"
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = var.ingress_protocol
    cidr_blocks = [var.ingress_cidr_block]
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = [var.egress_cidr_block]
  }
}

resource "aws_route_table" "name" {
  vpc_id = aws_vpc.name.id

  route {
    cidr_block = var.route_cidr_block
    gateway_id = aws_internet_gateway.name.id
  }
}

resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true

    tags = {
        Name = var.subnet_name
    }
}

resource "aws_instance" "name" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.name.id
  vpc_security_group_ids       = [aws_security_group.name.id]
  associate_public_ip_address  = true

  user_data = file("userdata.sh")

  user_data_replace_on_change = true

  tags = {
    Name = var.instance_name
  }
}

resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
        Name = var.internet_gateway_name
    }
}


resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.name.id
    route_table_id = aws_route_table.name.id
}



